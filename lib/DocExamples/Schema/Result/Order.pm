package DocExamples::Schema::Result::Order;

use DBIx::Class::Candy -autotable => v1;

primary_column id => {
    data_type => 'int',
    is_auto_increment => 1,
};

column name => {
    data_type => 'varchar',
    is_nullable => 1,
};

has_many lines => 'DocExamples::Schema::Result::OrderItem', 'order_id';
has_many delivery_charge => 'DocExamples::Schema::Result::OrderItem', 'order_id', { where => { type => 'delivery' } };


1;
