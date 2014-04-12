use Test::Most;
use Test::DBIx::Class {
    schema_class => 'DocExamples::Schema',
}, 'Order';

ok my $order = Order->create({ name => 'test' });

done_testing;
