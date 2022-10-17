Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2348B601B26
	for <lists+linux-aspeed@lfdr.de>; Mon, 17 Oct 2022 23:17:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MrqZL6fRGz3cd4
	for <lists+linux-aspeed@lfdr.de>; Tue, 18 Oct 2022 08:17:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E1RePHdf;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=quicinc.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=quic_jaehyoo@quicinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E1RePHdf;
	dkim-atps=neutral
X-Greylist: delayed 1004 seconds by postgrey-1.36 at boromir; Tue, 18 Oct 2022 08:17:05 AEDT
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MrqZ965xSz2xH6
	for <linux-aspeed@lists.ozlabs.org>; Tue, 18 Oct 2022 08:17:04 +1100 (AEDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29HK4Aax020772;
	Mon, 17 Oct 2022 21:00:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=D6PTclKQckbCBwVMkCe4UAqivm2Mn3NOcSkfQ97wmcQ=;
 b=E1RePHdfKe11rBb+dSirSyRR0iIfodoh/2kZKieOo+/ZyZnxGyNkJGJSxZBl9Z2/6DT3
 J882FBGj0jqWCTylrJAqq57eysdP5+x4gXzhOMCxoCd6MBT5xnG+uD3O4L7+rwttF/2u
 xJdwBrgOwmbZ5jHkpL1VG/HXJCbl2cjnWre07mggs69vkRsTl3EIHgvA1Tj5xPb5wYaK
 pEUTMTwnkhDFxlgI757DlIb2N2sHa9PI3RrEAmUbi7T1/tn2GbKSnSVNicoubxhXDbpZ
 uN9VzWWKvzPztFX0LgHXMazeMc4M5km+PR9GNb0ZU6p6zuHmq1ODkIA+2w7obI+2kxfx Fw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k7m6ud249-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Oct 2022 21:00:00 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29HKxxs2014897
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Oct 2022 20:59:59 GMT
Received: from [10.110.49.5] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Mon, 17 Oct
 2022 13:59:58 -0700
Message-ID: <75d65e4c-961a-0338-8101-d1ea05542dd6@quicinc.com>
Date: Mon, 17 Oct 2022 13:59:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH] usb: gadget: aspeed: Fix probe regression
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, Zev Weiss <zev@bewilderbeest.net>
References: <20221017053006.358520-1-joel@jms.id.au>
 <Y029u+ZZZikW4fYl@hatter.bewilderbeest.net>
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
In-Reply-To: <Y029u+ZZZikW4fYl@hatter.bewilderbeest.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: LybL_bHUFg_clhpM2JtrDF-UVpm83T9R
X-Proofpoint-GUID: LybL_bHUFg_clhpM2JtrDF-UVpm83T9R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-17_13,2022-10-17_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 bulkscore=0 spamscore=0 malwarescore=0 mlxlogscore=918 priorityscore=1501
 suspectscore=0 clxscore=1011 adultscore=0 impostorscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210170119
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
Cc: Felipe Balbi <balbi@kernel.org>, linux-aspeed@lists.ozlabs.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 10/17/2022 1:40 PM, Zev Weiss wrote:
> On Sun, Oct 16, 2022 at 10:30:06PM PDT, Joel Stanley wrote:
>> Since commit fc274c1e9973 ("USB: gadget: Add a new bus for gadgets"),
>> the gadget devices are proper driver core devices, which caused each
>> device to request pinmux settings:
>>
>> aspeed_vhub 1e6a0000.usb-vhub: Initialized virtual hub in USB2 mode
>> aspeed-g5-pinctrl 1e6e2080.pinctrl: pin A7 already requested by 
>> 1e6a0000.usb-vhub; cannot claim for gadget.0
>> aspeed-g5-pinctrl 1e6e2080.pinctrl: pin-232 (gadget.0) status -22
>> aspeed-g5-pinctrl 1e6e2080.pinctrl: could not request pin 232 (A7) 
>> from group USB2AD  on device aspeed-g5-pinctrl
>> g_mass_storage gadget.0: Error applying setting, reverse things back
>>
>> The vhub driver has already claimed the pins, so prevent the gadgets
>> from requesting them too by setting the magic of_node_reused flag. This
>> causes the driver core to skip the mux request.
>>
>> Reported-by: Zev Weiss <zev@bewilderbeest.net>
>> Reported-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
>> Fixes: fc274c1e9973 ("USB: gadget: Add a new bus for gadgets")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
> 
> Thanks Joel!
> 
> Tested-by: Zev Weiss <zev@bewilderbeest.net>

It works for my AST2600 build targets too. Thanks Joel!

Tested-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
