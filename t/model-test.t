use Test::Most;
use Test::DBIx::Class {
    schema_class => 'DocExamples::Schema',
}, 'Order';

ok my $order = Order->create({ name => 'test' });
ok $order->create_related('lines', {
    name => 'Test',
    type => 'test',
    quantity => 1,
    price => 2,
});
ok $order->create_related('delivery_charge', {
    name => 'Postage - Royal Mail',
    type => 'delivery',
    quantity => 1,
    price => 2.96,
});
my ($delivery) = $order->delivery_charge;
is $delivery->price, 2.96;

my $orders = Order->search(undef, {
    prefetch => ['delivery_charge'],
});
is $orders->count, 1;
my ($order) = $orders->all;
my @lines = $order->delivery_charge;
is scalar @lines, 1;


done_testing;
