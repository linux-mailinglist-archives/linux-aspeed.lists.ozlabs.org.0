Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D318557345
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 Jun 2022 08:44:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LT9hY2PlHz3bts
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 Jun 2022 16:44:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=IGrLPQYw;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=OfxQhbUL;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=dan.carpenter@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=IGrLPQYw;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=OfxQhbUL;
	dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LT9hM5lPBz303k
	for <linux-aspeed@lists.ozlabs.org>; Thu, 23 Jun 2022 16:43:58 +1000 (AEST)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25N0Vt50004659;
	Thu, 23 Jun 2022 06:43:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=KcdxISQoBxmfrCeaL2Z8yDI5f7kGbuPVoIoQ17g+zY4=;
 b=IGrLPQYwjm0BLoIpaAZOQbSriUHEIToQnOfRo8i4cfjkKevO2LQw9MjruUrmCpgVoV86
 cgVkhbVw8yW/+WutSjSCFTUEiCyhlJvEABIwAIv0S4qIa9WWSg5MVyFFk7q9pbg+SLb9
 TPI0himi8iG5bzJAjFvUjcLD9db15ppWW+AsbSbcwY13vWNJvZPAnbba9AvFez3E4D6y
 pEJApdCR608rgXSfTeTZOAyQICdd8nNm5SNWm4bcN7CbMfVKVYVmkwfnXvpOFfrpi1em
 NAA4zGOMqSfy+7c+4cfQJZfsDOh+MrEWG3IZxdg18ahH/c08uOWbb3ewWF5XPAlNDdK8 iw== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gs54ct7a3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jun 2022 06:43:44 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 25N6QtXg035691;
	Thu, 23 Jun 2022 06:43:43 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3gtg5w7hq1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jun 2022 06:43:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oRYtJ4t7v1wckwgKwmxvyS97E+374WDHCcNs+lvqq6H6bmqCHIyD4Q6FTjs3fdzUeHvDRzTcpdDeBZpAguMQrWPi03y8MVD1oX4W7XpRMqC+zIkDVfiq4G3jXjWMi/hVNpfl6FA2WajFc/hWB68JhZ3sp8jOElP1xy/SmX9BZcYPqWKXt5e21RkW2qzVmThV1yzCAdm3JuFO2BhrLOc62gRkTQpljzQ2RMo3Bt451GF8q8vg/Em5ox4GcShSOkDAMcFCoBnCC1GVsWP0CVyXlQ5mIklKiehNY5HnBojlDU2krG5U7xROMSFJkMn8plWImTnYV4MoXimETWvM6TBNmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KcdxISQoBxmfrCeaL2Z8yDI5f7kGbuPVoIoQ17g+zY4=;
 b=P2WKOieYADRKAtqb+pd6fh9MxhBwLCcEJKiwe8sUJaDJZTU7CHfT4MuJaGCODUkum5IBxQ5PN3kBWerLGTlZMxKyBtRC1lSpZSOZypytOjRi4oRZHLAdsnmMxrByGBsF6XNchwkpBK0ffqvkx3WxLHvqtLrQZ50aJ/RLPgmwJnijJGXQvGA0vUJ3o2fJAFqK00WjsZEQYQIih/Ds806suvc1+rm0OQDLKUGe0y45OJbbuxXO1FwG2kvDO3NsLPgQLxEXd4x2roTA+O9Ci9zI+p2kgcTB00+XiTE8G1sMyolbO9FTfFY1C0PRkIgkyEUgMCMZ/zuX+vu4VuzqwCVAGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KcdxISQoBxmfrCeaL2Z8yDI5f7kGbuPVoIoQ17g+zY4=;
 b=OfxQhbULmOP6jKjk2QHTp+Z4vLUhfmtUts/fdWQCSRDBgRBW7p8EPcKLi3fuD96vdwHWQQMp8bqUPBCHQdyFxdi2joXXt67HnfrJWHA04u6ftGK6NUTu1tza7ObrZUSM01ec59YPycfVnda4HXlxpeT15TTbT4nmw6+OMq71ytg=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM6PR10MB3724.namprd10.prod.outlook.com
 (2603:10b6:5:157::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Thu, 23 Jun
 2022 06:43:42 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5373.015; Thu, 23 Jun 2022
 06:43:42 +0000
Date: Thu, 23 Jun 2022 09:43:20 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Neal Liu <neal_liu@aspeedtech.com>
Subject: Re: [PATCH] usb: gadget: aspeed_udc: fix handling of tx_len == 0
Message-ID: <20220623064320.GN16517@kadam>
References: <YrMsU9HvdBm5YrRH@kili>
 <HK0PR06MB32023259EBD6B4C649C62E8280B59@HK0PR06MB3202.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <HK0PR06MB32023259EBD6B4C649C62E8280B59@HK0PR06MB3202.apcprd06.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0069.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::15)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21d84fcf-63be-4895-3c90-08da54e3b646
X-MS-TrafficTypeDiagnostic: DM6PR10MB3724:EE_
X-Microsoft-Antispam-PRVS: 	<DM6PR10MB3724917DDAF7BBF861B292438EB59@DM6PR10MB3724.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	kjMkGwQwuSMxg/FLMp6rWwWe0ruyaa50XZZ/vGIuhyA1Z+3NL9AmAs3Gqr4gFoGjJ+/m/wqzJrlMkdLgtHuXLZXO6fa12+TKZqoYjeh4RTL/ekq7e5/j8dc8SwOCW+UnJctdaNe9LRI1wQX2sXir0ZZ3WuAfas5VufXfWyZwPQnPy5ztD9KaAZ6txbYXEpzAlMlRoLnx9ZicIeuBHy76LXL97likeoYfJiWd0o64fsmcyjenNeHrTFviAjOJTkqB+yt0SN9EeGjLy2GP7Xx0NOqpPVOCdHm1Bk1YRPBDrOimspiPWYyVCK1NvIzFaIuxZN+Ge25fJ4YvpX4PrsQGMAb8HhQLNLk9KQdUCWjHs+uCbonc57M85z8rxtU28RlvyZYmFEjXqQjA7W+qj9NCKLYKkQo7SD10qT7kdTiprvZGw29Z7/nolnKeay/O1QIc7IMmi9jwBe8JkGiV+n4SHDvpRbipzyx/1OnYumn0JBSNa/r3rDvRk9WNyliglTtwxPyEA3ylN3Ua7MN7GISOtx6KBw7M50QcA3o0DwDk3Zys6M8lyoWvqeFdkxofu3UHr9mI4qJ6x86CF7+ZXMqzdc2twGmHnxX11DiUgBCaCsMMPeh347Rf0aAFSkf8WieQiNV1wo73iZQMQJIOvNEyz15H6gBfad2mHOFiSGlD1f0IhOz/lmgTf/zedjKGTHl/b1s2kuDR5PZaLJqB3VwYCPALUdRnOTPKcwEINZHE0x2ulL9LNCQdxkV3jXXX3MLb
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(346002)(376002)(396003)(366004)(39860400002)(136003)(316002)(6666004)(54906003)(9686003)(6916009)(2906002)(6512007)(41300700001)(26005)(52116002)(86362001)(6506007)(66946007)(8936002)(38350700002)(66556008)(6486002)(44832011)(33656002)(38100700002)(478600001)(186003)(33716001)(4326008)(4744005)(8676002)(5660300002)(66476007)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	3DAORu2ZIQze8+a0ooLXyGrzvmdwZp1yLCHDMNpComvWFUWVocTXvOdVLNLFtc4/xGC5vMlazrVHSYszFhg6oW+vJT8uDDh0arQ9tnVPHTplSqDuMCj5AD+gGpMKHF7igW69IQ8a7C0cCvLoDwi3CkmuLT7Vd/02Z4E344WdqXbN5qcoHGLU5ioXtVGEwYO78vv8VPCPAIVcCcuYOpRz5zY3aJ4/zX4tMCNIUBtXGXGbG3x08C9kP9h9JdRmvMzbniLRFtn4p31Y0LnlK9Wsh/SB6ZYFWIVlVIQRFh62+ojMsyJNwTTngmi+4c1n/Jf6FJplkbSBnYq8RxkNnhnUPweQtdZVEJYMS6MPXrqHzSP2msWE7hVha9jp4vgQXYanc3UzpkVpEsHGqzCcbVsRoXnwRjbaPrDN+HcLUsGCPX+MRlnOE/JQRX2msc1P5GLxDWbhcUuZv9Jr/avu6xD0Z+LkTCPycP2rjFERL2Am47Z0uQr815/76A1h34SM3v3flfpnSUYl2nUCeE+mvZw/ERqOD0z9U0gSba3Vx5vJ+QvmFVsF2OAsyTqSFESAYhzbM4JiGCzjOW5Haur9zv4Iy3z/LT4tOg9/uLr70zO2WPwz8lu2bpFKnIM0V2yk1gTZX3H/4Zuwx8XOwe5CKvkcoFuZgGeLrwiCSRnBqN42tYYgxaWE7VJfhIFslBf/BGEhgv40CVL9O1D0DwhomlzMRKy1bs0JezEyiDBUg4bEsSwDFRUeG7itA/MbDXYdfdGl
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21d84fcf-63be-4895-3c90-08da54e3b646
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 06:43:42.1212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pvikaR8vwn9xnf8oL1QbtWZl1mDE32XNBev+BKIEZgs3HCQ6xv/nGocHf8iV32YRGdTxCMdNsmVQIGxcyW9oVNW7WHqoWbN07WBtbxD+lxw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3724
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-06-23_03:2022-06-22,2022-06-23 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0
 mlxlogscore=536 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206230024
X-Proofpoint-GUID: dzZtp9W8zDZ4X0RRUnC32OHlcZvhhNuY
X-Proofpoint-ORIG-GUID: dzZtp9W8zDZ4X0RRUnC32OHlcZvhhNuY
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
Cc: Felipe Balbi <balbi@kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Jun 23, 2022 at 01:41:49AM +0000, Neal Liu wrote:
> > The bug is that we should still enter this loop if "tx_len" is zero.
> > 
> > After adding the "last" variable, then the "chunk >= 0" condition is no longer
> > required but I left it for readability.
> > 
> 
> Use either "chunk >=0" or "last".
> I think the former is more simpler.

chunk >= 0 doesn't work.  last works but I think this way is more
readable.

regards,
dan carpenter

