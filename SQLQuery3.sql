select count(*) as �`�H��
from �q�H�Ȥ�y��;

select count(case when �ʧO ='Male' then 1 end) as �k���`�H��, 
count(case when �ʧO ='Female' then 1 end) as �k���`�H��,
round
(1.0*count(case when �ʧO ='Male' then 1 end)/count(*), 4) as �k�ʤ��,
round
(1.0*count(case when �ʧO ='Female' then 1 end)/count(*), 4) as �k�ʤ��
from �q�H�Ȥ�y��;

select count(case when �O�_�����֫Ȥ� = 1 then 1 end) as ���֫Ȥ��`�H��,
count(case when �O�_�����֫Ȥ� = 0 then 1 end) as �D���֫Ȥ��`�H��,
round
(1.0*count(case when �O�_�����֫Ȥ� = 1 then 1 end) /count(*), 4) as ���֫Ȥ���,
round
(1.0*count(case when �O�_�����֫Ȥ� = 0 then 1 end)/count(*), 4) as �D���֫Ȥ���
from �q�H�Ȥ�y��;

SELECT 
    �O�_�����֫Ȥ�,
    COUNT(CASE WHEN �O�_�y�� = 'Yes' THEN 1 END) AS �y���H��,
    COUNT(*) AS �`�H��,
    ROUND(
        1.0 * COUNT(CASE WHEN �O�_�y�� = 'Yes' THEN 1 END) / COUNT(*), 4
    ) AS �y���v
FROM �q�H�Ȥ�y��
GROUP BY �O�_�����֫Ȥ�;

select
�O�_���q�ܪA��,
count(case when �O�_�y�� = 'Yes' then 1 end) as �y���H��,
count(*) as �`�H��,
round(
1.0*count(case when �O�_�y�� = 'yes' then 1 end)/count(*), 4
) as �y���v
from �q�H�Ȥ�y��
group by �O�_���q�ܪA��;


select 
�O�_���h���q�ܽu,
count(case when �O�_�y�� = 'Yes' then 1 end) as �y���H��,
count(*) as �`�H��,
round
(1.0*count(case when �O�_�y�� = 'Yes' then 1 end) / count(*), 4)
as �y���v
from �q�H�Ȥ�y��
group by �O�_���h���q�ܽu;

select 
�����A������,
count(case when �O�_�y�� = 'Yes' then 1 end) as �y���H��,
count(*) as �`�H��,
round
(1.0*count(case when �O�_�y�� = 'Yes' then 1 end) / count(*), 4)
as �y���v
from �q�H�Ȥ�y��
group by �����A������;

select 
�O�_���u�W�w�����@�A��,
count(case when �O�_�y�� = 'Yes' then 1 end) as �y���H��,
count(*) as �`�H��,
round
(1.0*count(case when �O�_�y�� = 'Yes' then 1 end) / count(*), 4)
as �y���v
from �q�H�Ȥ�y��
where �O�_���u�W�w�����@�A�� IN ('Yes', 'No')
group by �O�_���u�W�w�����@�A��;

select 
�O�_���u�W�ƥ��A��,
count(case when �O�_�y�� = 'Yes' then 1 end) as �y���H��,
count(*) as �`�H��,
round
(1.0*count(case when �O�_�y�� = 'Yes' then 1 end) / count(*), 4)
as �y���v
from �q�H�Ȥ�y��
where �O�_���u�W�ƥ��A�� In ('Yes', 'No')
group by �O�_���u�W�ƥ��A��;

select 
�O�_���]�ƫO�@�A��,
count(case when �O�_�y�� = 'Yes' then 1 end) as �y���H��,
count(*) as �`�H��,
round
(1.0*count(case when �O�_�y�� = 'Yes' then 1 end) / count(*), 4)
as �y���v
from �q�H�Ȥ�y��
where �O�_���]�ƫO�@�A�� In ('Yes', 'No')
group by �O�_���]�ƫO�@�A��;

select 
�O�_���޳N�䴩�A��,
count(case when �O�_�y�� = 'Yes' then 1 end) as �y���H��,
count(*) as �`�H��,
round
(1.0*count(case when �O�_�y�� = 'Yes' then 1 end) / count(*), 4)
as �y���v
from �q�H�Ȥ�y��
where �O�_���޳N�䴩�A�� in ('Yes', 'No')
group by �O�_���޳N�䴩�A��;

select 
�O�_����y�q���A��,
count(case when �O�_�y�� = 'Yes' then 1 end) as �y���H��,
count(*) as �`�H��,
round
(1.0*count(case when �O�_�y�� = 'Yes' then 1 end) / count(*), 4)
as �y���v
from �q�H�Ȥ�y��
where �O�_����y�q���A�� in ('Yes', 'No')
group by �O�_����y�q���A��;

select 
�O�_����y�q�v�A��,
count(case when �O�_�y�� = 'Yes' then 1 end) as �y���H��,
count(*) as �`�H��,
round
(1.0*count(case when �O�_�y�� = 'Yes' then 1 end) / count(*), 4)
as �y���v
from �q�H�Ȥ�y��
where �O�_����y�q�v�A�� in ('Yes', 'No')
group by �O�_����y�q�v�A��;

SELECT DISTINCT
  PERCENTILE_CONT(0.33) WITHIN GROUP (ORDER BY �C��O��) OVER () AS �T����1,
  PERCENTILE_CONT(0.66) WITHIN GROUP (ORDER BY �C��O��) OVER () AS �T����2
FROM �q�H�Ȥ�y��;

SELECT DISTINCT
  PERCENTILE_CONT(0.33) WITHIN GROUP (ORDER BY �`�p�O��) OVER () AS �T����1,
  PERCENTILE_CONT(0.66) WITHIN GROUP (ORDER BY �`�p�O��) OVER () AS �T����2
FROM �q�H�Ȥ�y��;


with ��O���� as 
(
select �C��O��, �O�_�y��,
case when 
�C��O�� < 50 then '�C��O' 
when �C��O�� between 50 and 85 then '����O'
else '����O'
end as ��O����
from �q�H�Ȥ�y��
)

select ��O����, 
count(case when �O�_�y�� = 'Yes' then 1 end) as �y���H��, 
count(*) as �`�H��,
round
(1.0*count(case when �O�_�y�� = 'Yes' then 1 end) / count(*), 4)
as �y���v
from ��O����
group by ��O����
order by 
case ��O����
when '�C��O' then 1
when '����O' then 2
when '����O' then 3
end;
 
 with �`�O�Τ��� as 
(
select �`�p�O��, �O�_�y��,
case when 
�`�p�O�� < 700 then '�C�`�O' 
when �`�p�O�� between 700 and 2700 then '���`�O'
else '���`�O'
end as �`�O������
from �q�H�Ȥ�y��
)

select �`�O������, 
count(case when �O�_�y�� = 'Yes' then 1 end) as �y���H��, 
count(*) as �`�H��,
round
(1.0*count(case when �O�_�y�� = 'Yes' then 1 end) / count(*), 4)
as �y���v
from �`�O�Τ���
group by �`�O������
order by 
case �`�O������
when '�C�`�O' then 1
when '���`�O' then 2
when '���`�O' then 3
end;

select [�X�������]��ơ^],
  count(case when �O�_�y�� = 'Yes' then 1 end) as �y���H��,
  count(*) as �`�H��,
  round(1.0 * count(case when �O�_�y�� = 'Yes' then 1 end) / count(*), 4) as �y���v
from �q�H�Ȥ�y��
group by [�X�������]��ơ^]
order by [�X�������]��ơ^];

with �X������ as 
(
select [�X�������]��ơ^], �O�_�y��,
case when 
[�X�������]��ơ^] < 20 then '�s�Τ�' 
when [�X�������]��ơ^] between 20 and 40 then '����Τ�'
when [�X�������]��ơ^] between 41 and 60 then '�����Τ�'
else '�����Τ�'
end as �X��������
from �q�H�Ȥ�y��
)

select �X��������, 
count(case when �O�_�y�� = 'Yes' then 1 end) as �y���H��, 
count(*) as �`�H��,
round
(1.0*count(case when �O�_�y�� = 'Yes' then 1 end) / count(*), 4)
as �y���v
from �X������
group by �X��������
order by 
case �X��������
when '�s�Τ�' then 1
when '����Τ�' then 2
when '�����Τ�' then 3
when '�����Τ�' then 4
end;

select �I�ڤ覡,
  count(case when �O�_�y�� = 'Yes' then 1 end) as �y���H��,
  count(*) as �`�H��,
  round(1.0 * count(case when �O�_�y�� = 'Yes' then 1 end) / count(*), 4) as �y���v
from �q�H�Ȥ�y��
group by �I�ڤ覡
order by �I�ڤ覡;

select �O�_�ϥιq�l�b��,
  count(case when �O�_�y�� = 'Yes' then 1 end) as �y���H��,
  count(*) as �`�H��,
  round(1.0 * count(case when �O�_�y�� = 'Yes' then 1 end) / count(*), 4) as �y���v
from �q�H�Ȥ�y��
group by �O�_�ϥιq�l�b��;


select �X������,
  count(case when �O�_�y�� = 'Yes' then 1 end) as �y���H��,
  count(*) as �`�H��,
  round(1.0 * count(case when �O�_�y�� = 'Yes' then 1 end) / count(*), 4) as �y���v
from �q�H�Ȥ�y��
group by �X������;

with �A���`�� as 
(
select �Ȥ�s��, �O�_�y��,
(
case when �O�_���u�W�w�����@�A�� = 'Yes' then 1 else 0 end +
case when �O�_���u�W�ƥ��A�� = 'Yes' then 1 else 0 end +
case when �O�_���]�ƫO�@�A�� = 'Yes' then 1 else 0 end +
case when �O�_���޳N�䴩�A�� = 'Yes' then 1 else 0 end +
case when �O�_����y�q���A�� = 'Yes' then 1 else 0 end +
case when �O�_����y�q�v�A�� = 'Yes' then 1 else 0 end
)
as �����A�ȼƶq
from �q�H�Ȥ�y��
)

select �����A�ȼƶq,
count(case when �O�_�y�� ='Yes' then 1 end) as �y���H��,
count(*) as �`�H��,
round
(1.0*count(case when �O�_�y�� = 'Yes' then 1 end) / count(*), 4)
as �y���v
from �A���`��
group by �����A�ȼƶq
order by �����A�ȼƶq;


select �ʧO,�O�_���u�W�w�����@�A��,
count(case when �O�_�y�� = 'Yes' then 1 end) as �y���H��,
count(*) as �`�H��,
round
(1.0*count(case when �O�_�y�� = 'Yes' then 1 end) / count(*), 4
)as �y���v
from �q�H�Ȥ�y��
where �O�_���u�W�w�����@�A�� in ('Yes', 'No')
group by �ʧO, �O�_���u�W�w�����@�A��;

select �ʧO,�O�_���u�W�ƥ��A��,
count(case when �O�_�y�� = 'Yes' then 1 end) as �y���H��,
count(*) as �`�H��,
round
(1.0*count(case when �O�_�y�� = 'Yes' then 1 end) / count(*), 4
)as �y���v
from �q�H�Ȥ�y��
where �O�_���u�W�ƥ��A�� in ('Yes', 'No')
group by �ʧO, �O�_���u�W�ƥ��A��;

select �ʧO,�O�_���]�ƫO�@�A��,
count(case when �O�_�y�� = 'Yes' then 1 end) as �y���H��,
count(*) as �`�H��,
round
(1.0*count(case when �O�_�y�� = 'Yes' then 1 end) / count(*), 4
)as �y���v
from �q�H�Ȥ�y��
where �O�_���]�ƫO�@�A�� in ('Yes', 'No')
group by �ʧO, �O�_���]�ƫO�@�A��;

select �ʧO,�O�_���޳N�䴩�A��,
count(case when �O�_�y�� = 'Yes' then 1 end) as �y���H��,
count(*) as �`�H��,
round
(1.0*count(case when �O�_�y�� = 'Yes' then 1 end) / count(*), 4
)as �y���v
from �q�H�Ȥ�y��
where �O�_���޳N�䴩�A�� in ('Yes', 'No')
group by �ʧO, �O�_���޳N�䴩�A��;

select �ʧO,�O�_����y�q���A��,
count(case when �O�_�y�� = 'Yes' then 1 end) as �y���H��,
count(*) as �`�H��,
round
(1.0*count(case when �O�_�y�� = 'Yes' then 1 end) / count(*), 4
)as �y���v
from �q�H�Ȥ�y��
where �O�_����y�q���A�� in ('Yes', 'No')
group by �ʧO, �O�_����y�q���A��;

select �ʧO,�O�_����y�q�v�A��,
count(case when �O�_�y�� = 'Yes' then 1 end) as �y���H��,
count(*) as �`�H��,
round
(1.0*count(case when �O�_�y�� = 'Yes' then 1 end) / count(*), 4
)as �y���v
from �q�H�Ȥ�y��
where �O�_����y�q�v�A�� in ('Yes', 'No')
group by �ʧO, �O�_����y�q�v�A��; 


select �O�_�����֫Ȥ�, �O�_���u�W�w�����@�A��,
count(case when �O�_�y�� = 'Yes' then 1 end) as �y���H��,
count(*) as �`�H��,
round
(1.0*count(case when �O�_�y�� = 'Yes' then 1 end) / count(*), 4
)as �y���v
from �q�H�Ȥ�y��
where �O�_���u�W�w�����@�A�� in ('Yes', 'No')
group by �O�_�����֫Ȥ�, �O�_���u�W�w�����@�A��;


select �O�_�����֫Ȥ�,�O�_���u�W�ƥ��A��,
count(case when �O�_�y�� = 'Yes' then 1 end) as �y���H��,
count(*) as �`�H��,
round
(1.0*count(case when �O�_�y�� = 'Yes' then 1 end) / count(*), 4
)as �y���v
from �q�H�Ȥ�y��
where �O�_���u�W�ƥ��A�� in ('Yes', 'No')
group by �O�_�����֫Ȥ�, �O�_���u�W�ƥ��A��;

select �O�_�����֫Ȥ�,�O�_���]�ƫO�@�A��,
count(case when �O�_�y�� = 'Yes' then 1 end) as �y���H��,
count(*) as �`�H��,
round
(1.0*count(case when �O�_�y�� = 'Yes' then 1 end) / count(*), 4
)as �y���v
from �q�H�Ȥ�y��
where �O�_���]�ƫO�@�A�� in ('Yes', 'No')
group by �O�_�����֫Ȥ�, �O�_���]�ƫO�@�A��;

select �O�_�����֫Ȥ�,�O�_���޳N�䴩�A��,
count(case when �O�_�y�� = 'Yes' then 1 end) as �y���H��,
count(*) as �`�H��,
round
(1.0*count(case when �O�_�y�� = 'Yes' then 1 end) / count(*), 4
)as �y���v
from �q�H�Ȥ�y��
where �O�_���޳N�䴩�A�� in ('Yes', 'No')
group by �O�_�����֫Ȥ�, �O�_���޳N�䴩�A��;

select �O�_�����֫Ȥ�,�O�_����y�q���A��,
count(case when �O�_�y�� = 'Yes' then 1 end) as �y���H��,
count(*) as �`�H��,
round
(1.0*count(case when �O�_�y�� = 'Yes' then 1 end) / count(*), 4
)as �y���v
from �q�H�Ȥ�y��
where �O�_����y�q���A�� in ('Yes', 'No')
group by �O�_�����֫Ȥ�, �O�_����y�q���A��;

select �O�_�����֫Ȥ�,�O�_����y�q�v�A��,
count(case when �O�_�y�� = 'Yes' then 1 end) as �y���H��,
count(*) as �`�H��,
round
(1.0*count(case when �O�_�y�� = 'Yes' then 1 end) / count(*), 4
)as �y���v
from �q�H�Ȥ�y��
where �O�_����y�q�v�A�� in ('Yes', 'No')
group by �O�_�����֫Ȥ�, �O�_����y�q�v�A��;

with ��O�O�� as (
select �C��O��,�O�_���u�W�w�����@�A��,�O�_�y��,
case when �C��O�� < 50 then '�C��O'
when �C��O�� between 50 and 85 then '����O'
else '����O'
end as ��O����
from �q�H�Ȥ�y��
)

select ��O����,�O�_���u�W�w�����@�A��,
count(case when �O�_�y�� = 'Yes' then 1 end) as �y���H��,
count(*) as �`�H��,
round
(1.0*count(case when �O�_�y�� = 'Yes' then 1 end)/count(*), 4) as �y���v
from ��O�O��
where �O�_���u�W�w�����@�A�� in ('Yes', 'No')
group by ��O����, �O�_���u�W�w�����@�A��
order by 
case ��O����
when '�C��O' then 1
when '����O' then 2
when '����O' then 3
end;

with ��O�O�� as (
select �C��O��,�O�_���u�W�ƥ��A��,�O�_�y��,
case when �C��O�� < 50 then '�C��O'
when �C��O�� between 50 and 85 then '����O'
else '����O'
end as ��O����
from �q�H�Ȥ�y��
)

select ��O����,�O�_���u�W�ƥ��A��,
count(case when �O�_�y�� = 'Yes' then 1 end) as �y���H��,
count(*) as �`�H��,
round
(1.0*count(case when �O�_�y�� = 'Yes' then 1 end)/count(*), 4) as �y���v
from ��O�O��
where �O�_���u�W�ƥ��A�� in ('Yes', 'No')
group by ��O����, �O�_���u�W�ƥ��A��
order by 
case ��O����
when '�C��O' then 1
when '����O' then 2
when '����O' then 3
end;

with ��O�O�� as (
select �C��O��,�O�_���]�ƫO�@�A��,�O�_�y��,
case when �C��O�� < 50 then '�C��O'
when �C��O�� between 50 and 85 then '����O'
else '����O'
end as ��O����
from �q�H�Ȥ�y��
)

select ��O����,�O�_���]�ƫO�@�A��,
count(case when �O�_�y�� = 'Yes' then 1 end) as �y���H��,
count(*) as �`�H��,
round
(1.0*count(case when �O�_�y�� = 'Yes' then 1 end)/count(*), 4) as �y���v
from ��O�O��
where �O�_���]�ƫO�@�A�� in ('Yes', 'No')
group by ��O����, �O�_���]�ƫO�@�A��
order by 
case ��O����
when '�C��O' then 1
when '����O' then 2
when '����O' then 3
end;

with ��O�O�� as (
select �C��O��,�O�_���޳N�䴩�A��,�O�_�y��,
case when �C��O�� < 50 then '�C��O'
when �C��O�� between 50 and 85 then '����O'
else '����O'
end as ��O����
from �q�H�Ȥ�y��
)

select ��O����,�O�_���޳N�䴩�A��,
count(case when �O�_�y�� = 'Yes' then 1 end) as �y���H��,
count(*) as �`�H��,
round
(1.0*count(case when �O�_�y�� = 'Yes' then 1 end)/count(*), 4) as �y���v
from ��O�O��
where �O�_���޳N�䴩�A�� in ('Yes', 'No')
group by ��O����, �O�_���޳N�䴩�A��
order by 
case ��O����
when '�C��O' then 1
when '����O' then 2
when '����O' then 3
end;

with ��O�O�� as (
select �C��O��,�O�_����y�q���A��,�O�_�y��,
case when �C��O�� < 50 then '�C��O'
when �C��O�� between 50 and 85 then '����O'
else '����O'
end as ��O����
from �q�H�Ȥ�y��
)

select ��O����,�O�_����y�q���A��,
count(case when �O�_�y�� = 'Yes' then 1 end) as �y���H��,
count(*) as �`�H��,
round
(1.0*count(case when �O�_�y�� = 'Yes' then 1 end)/count(*), 4) as �y���v
from ��O�O��
where �O�_����y�q���A�� in ('Yes', 'No')
group by ��O����, �O�_����y�q���A��
order by 
case ��O����
when '�C��O' then 1
when '����O' then 2
when '����O' then 3
end;

with ��O�O�� as (
select �C��O��,�O�_����y�q�v�A��,�O�_�y��,
case when �C��O�� < 50 then '�C��O'
when �C��O�� between 50 and 85 then '����O'
else '����O'
end as ��O����
from �q�H�Ȥ�y��
)

select ��O����,�O�_����y�q�v�A��,
count(case when �O�_�y�� = 'Yes' then 1 end) as �y���H��,
count(*) as �`�H��,
round
(1.0*count(case when �O�_�y�� = 'Yes' then 1 end)/count(*), 4) as �y���v
from ��O�O��
where �O�_����y�q�v�A�� in ('Yes', 'No')
group by ��O����, �O�_����y�q�v�A��
order by 
case ��O����
when '�C��O' then 1
when '����O' then 2
when '����O' then 3
end;

with ��O���� as (
select �C��O��, �X������, �O�_�y��,
case when
�C��O�� < 50 then '�C��O'
when �C��O�� between 50 and 85 then '����O'
else '����O'
end as ��O����
from �q�H�Ȥ�y��
)

select ��O����,�X������,
count(case when �O�_�y�� ='Yes' then 1 end) as �y���H��,
count(*) as �`�H��,
round
(1.0*count(case when �O�_�y�� = 'Yes' then 1 end)/count(*), 4) as �y���v
from ��O����
group by ��O����, �X������
order by 
case ��O����
when '�C��O' then 1
when '����O' then 2
when '����O' then 3
end;

select �O�_�����֫Ȥ�, �O�_�ϥιq�l�b��,
count(case when �O�_�y�� = 'Yes' then 1 end) as �y���H��,
count(*) as �`�H��,
round
(1.0* count(case when �O�_�y�� = 'Yes' then 1 end)/count(*), 4) as �y���v
from �q�H�Ȥ�y��
group by �O�_�����֫Ȥ�, �O�_�ϥιq�l�b��;

SELECT 
    COUNT(CASE WHEN �O�_�y�� = 'Yes' THEN 1 END) AS �y���H��,
    count(case when �O�_�y�� = 'No' then 1 end) as �D�y���H��,
    COUNT(*) AS �`�H��,
    ROUND(
        1.0 * COUNT(CASE WHEN �O�_�y�� = 'Yes' THEN 1 END) / COUNT(*), 4
    ) AS �y���v
FROM �q�H�Ȥ�y��;