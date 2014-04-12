package DocExamples::Schema::Result::OrderItem;

use DBIx::Class::Candy -autotable => v1;

primary_column id => {
    data_type => 'int',
    is_auto_increment => 1,
};

column order_id => {
    data_type => 'int',
    is_nullable => 0,
};

column name => {
    data_type => 'varchar',
    is_nullable => 0,
};

column type => {
    data_type => 'varchar',
    is_nullable => 0,
};

column quantity => {
    data_type => 'int',
    is_nullable => 0,
};

column price => {
    data_type => 'numeric',
    is_nullable => 0,
};

belongs_to order => 'DocExamples::Schema::Result::Order', 'order_id';


1;

