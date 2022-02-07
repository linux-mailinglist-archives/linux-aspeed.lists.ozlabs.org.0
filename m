Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 815014ABE9B
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Feb 2022 13:41:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jsm3n1W0zz3bP1
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Feb 2022 23:41:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=Y3Fd3pzA;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=arEWBh/g;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.177.32;
 helo=mx0b-00069f02.pphosted.com; envelope-from=dan.carpenter@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2021-07-09 header.b=Y3Fd3pzA; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=arEWBh/g; dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jsm3f71pFz30Ds
 for <linux-aspeed@lists.ozlabs.org>; Mon,  7 Feb 2022 23:41:27 +1100 (AEDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 217CcoEi006645; 
 Mon, 7 Feb 2022 12:41:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=Klh64ml+KMR6S11rde0zfr4y6uQqBZ8llJsaNE3AKzc=;
 b=Y3Fd3pzAe1UhlQt6jJRprP80Frw5KznJY8f/w2idHnAmLl0RCKPW8idMKWMBKTnXAqFC
 TBpFaA4LmjnwZJUOjWF/m47xzmVTQzYzJYuCx0xAgWN0rgDDzkb3e6hgp2g7kqll+TYG
 3QVEMWe1wv+ly8d602za3X9gShHWmowULZDU/vjrlKsv5gLiB9dTklIf1IbHRmUqnGMy
 gFanIzW23raRnuuvivGE4M65yEPPrakcJxHyFo4hkoOB7aM++82aYTEeukIHHAq8Pimy
 ush/XrxUaNjxoiehZUDXeqt+iKAGv1XwCnvrF5X4Qn1MdlXAm/n0Zz8Cu7tyqYp0RGPL CQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e1guswxbg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Feb 2022 12:41:20 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 217Ca01w089527;
 Mon, 7 Feb 2022 12:41:18 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
 by userp3030.oracle.com with ESMTP id 3e1ebx19xv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Feb 2022 12:41:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZlBmhUMrC6nAFVyt+JYxd4QN3Ik+6kWNfofV1tJGUu4bWH6Bdd78YImb9iOhsh+gHDBPUBFNvRcOB6J+K2vm/06b7bjd6etOG/LPCmKT6KCL6LoZ8oULVbAM+7QSgY5M1OhlvfDaawCxzwXaz/rcofbuy6EcLdhm842+1VQ0TF6puLOZ1U/PPRfA59M4pkUcavjnWm5Ruu7JsLY9dBE2pF3iaAG/4D9uUMTo0YpndCA+bbkp2mRktvBlTS4nzgreOjfF6+a2CYNbakGaut/6TdTgoKKLFQKx3wYuKGaioufjnTkgsBhG8WOAURtMpgbXvG273m6VYc53AHwe3Xw4jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Klh64ml+KMR6S11rde0zfr4y6uQqBZ8llJsaNE3AKzc=;
 b=m1C972203hwL2tglOB3sbcj34p3ys776GhDdYqQlaLgfVyQEXmjrB0znYMxcxqW5WZGc5d9ExfZL68suAAyUVEAbVIcRuALYmXX2OXNmm4zl/WmickQCyBy4/9Sn8FNLMakwMrYNa4j5KznrtO+DoXrnXbz9FkjM45mSPjQsJ6SHkETuDDNa1j0qs3vLUfcRm+zmomcY0bk71vY/UhVSsV/T44zA0dESJbhSToFalmTz5IePcGrhbJz/E7VN3x1ViOM/RNLDGp4Swt0dSuHaq9S3H85ixp5V/HuOGbRyWsjIlJteh1iU0Lkgg4/zXR25aoSnR3Tnb7ISRINkhfDRFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Klh64ml+KMR6S11rde0zfr4y6uQqBZ8llJsaNE3AKzc=;
 b=arEWBh/gPr5PlxEXnSHYl92TNa0ZJ03bep+U0kuy0G0oApILpK13WRiJFuVH37gZ06UGH1CaCsvGmEw5CV9QaTEASPhKMjCzksnqAd8mgUgIKwrgQxSGHAGL4Wkfi+/TMEadPMHqVV25bmzT3EJrTPRza5RxZpRhEbEpFNCys9k=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM5PR10MB1785.namprd10.prod.outlook.com
 (2603:10b6:4:b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Mon, 7 Feb
 2022 12:41:16 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::e5a5:8f49:7ec4:b7b8]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::e5a5:8f49:7ec4:b7b8%5]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 12:41:16 +0000
Date: Mon, 7 Feb 2022 15:41:07 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: andrew@aj.id.au
Subject: [bug report] pinctrl: aspeed: Improve debug output
Message-ID: <20220207124107.GA19955@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0104.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::19) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae5bc631-f194-4894-e906-08d9ea3721bf
X-MS-TrafficTypeDiagnostic: DM5PR10MB1785:EE_
X-Microsoft-Antispam-PRVS: <DM5PR10MB17851ED0AB2B130F8CFB2F1C8E2C9@DM5PR10MB1785.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:785;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Omo0X7umLtEsV82CWEeKoc9X5qtmWeNbAMshdC+buC4BmCrVz5MntFs5VM3rcbenF525/aIXX7FXQobtbXcKCb/Am+1SzUEzgLlYh3vK0W0a50TPae86cHlgGnf/DqLamL5iYYiGUp+IG6vriHp52stLcqhZ0sOGzsXpsbISVD4rWhihylibwLXKTUs+un0nYi2T2/Vh+7V2aO6tnvSS7xt1phY/G4Wu4h5Tnlm43Rx4O6clw96wlQF5FKWJiX/fmaviXy1CiQIpQ4nbqQrRFL0h9ABWTqdFP1fC83ZbtNOeuv6sKBHBlj4VElhibT6Cbfdxkw5udJciGyexBZz+xWwyl1Rx4WeirkPtFLpyL3v+2rGsEkEH0sywm+HxhawRcr+EVE5q4aEqAgf6wFHVw6pVE32SfufvYjaibxaeybPlN0latF/LH82CLIK3Qmw2zADoL1urhkPzIf4S1rcookr2f6UhqAMq3iaycLHMbGiDv5avJ9yUAL51HcuEpnsXzZRQuLVCEKif3sSg0gvvg06CYypEZanbLSi6n+hxQsPLeymjBVcpXSJ9veu1Vh8cJV7RV+6TI+K1+Lqq9awEieTeX3KeVrPqzb0bmb24QQu0WYpf/j45Q/FLZ05SZy1bIn9Gxji4lg19QBZXFJT8Jpzn0EyRjpwCOcI60PM8frVPNOp+cVJMKVfS0dhIVb97YLgCaYTIaOM/1dKB4Aro7Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(86362001)(83380400001)(316002)(6916009)(6486002)(38100700002)(38350700002)(508600001)(2906002)(6506007)(66946007)(4326008)(8676002)(8936002)(66556008)(66476007)(5660300002)(33656002)(4744005)(44832011)(26005)(186003)(1076003)(33716001)(6666004)(9686003)(6512007)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yH9ngW5kYdqiNeOWLI/ZU10G3JeywRs/7pqR2xQMFtW+krMkjzjlp8mcIK5q?=
 =?us-ascii?Q?lmMA7Nzd0vd71J6i+r4Bi1J8fghEZK4dJOLGRetKpr8YDOrQeeXQ8obYeW4S?=
 =?us-ascii?Q?4waxIv6OtvknQQI1XIveEP9XaZw2xViR8tNH0CjACH0Hs/wKEmFvscYHDfaZ?=
 =?us-ascii?Q?tcABJALDUzEBEgd+MYKAqyO73TQxGFi+Q4v+jATdB8ZepKgxvtq0ADLhqN90?=
 =?us-ascii?Q?XCN0xkU3ItN5JkXlpr+z2TR4vS28AmHfrRF2LcisBnGRoz7202eEk/4NcxdU?=
 =?us-ascii?Q?g27aoRmRM6a28XDcpyDkqXJhuztYtoxDs/mfGler+qgAfVsBZHIqOS1mqAlA?=
 =?us-ascii?Q?Cuk0QUP2uURkKz5EEMZkBpg84dYcdcmTMj+ea57BVtS5KF98golz/O+v/qS/?=
 =?us-ascii?Q?8ObmECFlSwCHyLrKhMrN01Zxy2yV3YgEURWfISMsklfmz83Ywx+SAuKS/nef?=
 =?us-ascii?Q?ZcN5MZ/uP3olCzr9/4Acm8POcTyjY9FlAiyX0D8siM32PksXEJgrcnRsB/5Q?=
 =?us-ascii?Q?s2rQ1owd6/t87iqkBW6IAIcX4OBv8zZy09nibd8GwFzD4hLYbIYWs45xIjUM?=
 =?us-ascii?Q?JiAskNVaUOegxINcTpxZ5eK+eHA4SGwfe5TvOb0u6oNaYMiS0mMM5UvCtuwI?=
 =?us-ascii?Q?PuCIH5J0Z6xcmuMQ2XQGe0B2q+mFRuPcZgXEtH5C2aqXHAzWI78YB4EFZn5L?=
 =?us-ascii?Q?eH55VnYqV8hCmP+GTsUtOA17/wEyWYC8IhuuosK56YVhyVOLQLwV/M2hcygD?=
 =?us-ascii?Q?cMkWL5wKu5YTviJTNNiOlhCThGZfvuVule+IxZ5woMeuiHvQa6Aw4DWdK5kC?=
 =?us-ascii?Q?ASBrqk3Kj/IUFYvFhmF/lpxaBmLKOx/qX/Bjj0UuLuvJELWJ7gP6ITVyFiRp?=
 =?us-ascii?Q?gX0E8+Gb4TI+1C81i1F+ada1w8YV66YwEX5goQEnk4Ga4ODN0aDQ8swFqaUc?=
 =?us-ascii?Q?Zr7HABxFktblICtK3zSjqXVkhZz9m6m5k5f/PiZdvHTPX8s5TyEA7vM3asDC?=
 =?us-ascii?Q?oHNplNGyxpAtVhZwUb0Kqbsmt/IAczgAi+mXaZBb2/iT+xeooKCE1kHvaML4?=
 =?us-ascii?Q?jXyLnaHRQ5CxSk0BoKTBxu2yp5Z7mTvY7J7qOeKOJJ6imx8vcZ8stw3DuFh9?=
 =?us-ascii?Q?Nttpw8qBVv33DaSK2Z9rr7jNFponTuTyNJFJyCYVf1c1RJKbAXq0tU1z3UHr?=
 =?us-ascii?Q?ANmVDCr5s1DH5eIW+rS0ZCdCtLeS+AHfLc5s2p/S1S4p4vmGuIL19MvSOT8N?=
 =?us-ascii?Q?zNwgsYkpvmNesOL8vt6MJ0AUILwt2pc2jZ2lqSVcM2JsLjbaRjM+bWIOFbR7?=
 =?us-ascii?Q?/A6xKo4KEyaPnTCjF71zDGim9cTXHkHcPnu5uRw92Gc+X3iAFdagOvTXLSgD?=
 =?us-ascii?Q?6fhViZlfG58ivwy846yvT3mFXWqL1894cvU5P09kQUPgo96du8Xn3CrXApuq?=
 =?us-ascii?Q?ceLcg2jj00oZPL3JRspZkDGcc+I9tT9rU158rh5RdHWSYBdaMEuLNAN3ibXT?=
 =?us-ascii?Q?1bzq94zGjb9WXTFDpI5GAK6siSpUHldo3/AaCO6Yzyx3cfzOTeYVnWZAji11?=
 =?us-ascii?Q?AWzbFTntEuuOoj+6WEWGSxBVzYRWVTLILLQbBxzG61mDlL4zputmpcDpTfuC?=
 =?us-ascii?Q?3NcO12DWm+hZZeehUhAdMC85C7vb7u/v95la2zIxyU75KkpjOLH3iyVvVFmV?=
 =?us-ascii?Q?NEfFgQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae5bc631-f194-4894-e906-08d9ea3721bf
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 12:41:16.0899 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zuhw/H3pjsKxqMWyDwBk0JoLuKmf9QC7l1z6ittkQWrQQ4M81yc274MP1u7+uHkocj13V3aSBDT1g15wyxF4jRZ31wrHWo4I05sEYSwKio4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1785
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10250
 signatures=673430
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 suspectscore=0
 mlxlogscore=768 mlxscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202070081
X-Proofpoint-ORIG-GUID: kyOLLEiJW19lNTljRs84dtw46IbVryii
X-Proofpoint-GUID: kyOLLEiJW19lNTljRs84dtw46IbVryii
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello Andrew Jeffery,

This is a semi-automatic email about new static checker warnings.

The patch aa639e443704: "pinctrl: aspeed: Improve debug output" from
Jul 1, 2020, leads to the following Smatch complaint:

    ./drivers/pinctrl/aspeed/pinctrl-aspeed.c:241 aspeed_pinmux_set_mux()
    warn: variable dereferenced before check 'pdesc' (see line 239)

./drivers/pinctrl/aspeed/pinctrl-aspeed.c
   238	
   239			pr_debug("Muxing pin %s for %s\n", pdesc->name, pfunc->name);
                                                           ^^^^^^^^^^^
Dereference

   240	
   241			if (!pdesc)
                             ^^^^^
Checked too late.

   242				return -EINVAL;
   243	

regards,
dan carpenter
