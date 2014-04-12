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

has_many delivery_charge => 'DocExamples::Schema::Result::OrderItem', 'order_id', 
            { where => { type => 'delivery' } };

has_many standard_products => 'DocExamples::Schema::Result::OrderItem', 
            sub {
                my $args = shift;
                return (
                    {
                        "$args->{self_alias}.id" => { -ident => "$args->{foreign_alias}.order_id" }, 
                        "$args->{foreign_alias}.type" => 'standard',
                    }
                );
            }; # 'Custom join conditions' perldoc DBIx::Class:Relationship::Base

1;
