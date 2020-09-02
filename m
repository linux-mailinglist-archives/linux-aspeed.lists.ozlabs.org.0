Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BC49E25B050
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Sep 2020 17:55:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhT6l1jqTzDqww
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Sep 2020 01:55:27 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=j/L2keva; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhSxc0yzRzDqxG
 for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Sep 2020 01:47:31 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 082FW52j046432; Wed, 2 Sep 2020 11:47:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=B9HMMIYxV7dLKsUViztHWLvJvaoop/tt7LeMtRlkEdg=;
 b=j/L2kevaqTtg0L2RSlXvTdVbe+bR5FpGm3jSl3XkfCeJYMtWlz4wTp6ho1KQ7ifeuYss
 JhzRrfLNCMor+uQiL3FlIUBJ0UtFGbxHPonJa1PJlFPUCo1B/l5mcqCSAdoShdaKiN14
 OI+qbcqPndA51Ome97Nwjj/oOiiMsE4D/6gJgsRMCeKq2amt5Z3C1V7WlrDOkWBcH5It
 zEXxwgkzWsOftYzMqm/qny+zP9gR6LVkAT9kQgJRt/b4e7mj2+75aYFypfh5nWvf2P5Z
 8RJjuQUKgDS9zDlhCs7RjyWonF3AcReiB2nm12t4AXCs1ZbrdROeyXXH6jXqBZ2sjTka Fw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33ae37rh9x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Sep 2020 11:47:23 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 082FgMtE113019;
 Wed, 2 Sep 2020 11:47:22 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33ae37rh8u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Sep 2020 11:47:22 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 082FlK8B021110;
 Wed, 2 Sep 2020 15:47:20 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01wdc.us.ibm.com with ESMTP id 337en990f3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Sep 2020 15:47:20 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 082FlGsH34472356
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Sep 2020 15:47:16 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5785C78064;
 Wed,  2 Sep 2020 15:47:19 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CA4E67806B;
 Wed,  2 Sep 2020 15:47:18 +0000 (GMT)
Received: from [9.211.74.86] (unknown [9.211.74.86])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  2 Sep 2020 15:47:18 +0000 (GMT)
Subject: Re: [PATCH 2/5] input: misc: Add IBM Operation Panel driver
To: Wolfram Sang <wsa@kernel.org>
References: <20200820161152.22751-1-eajames@linux.ibm.com>
 <20200820161152.22751-3-eajames@linux.ibm.com>
 <20200901061108.GB1148@ninjato>
From: Eddie James <eajames@linux.ibm.com>
Message-ID: <796de8d4-6771-a8da-ea93-6e7e08aa93b0@linux.ibm.com>
Date: Wed, 2 Sep 2020 10:47:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200901061108.GB1148@ninjato>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-02_09:2020-09-02,
 2020-09-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1011
 mlxlogscore=999 malwarescore=0 priorityscore=1501 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009020144
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 dmitry.torokhov@gmail.com, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 linux-input@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On 9/1/20 1:11 AM, Wolfram Sang wrote:
>> +	switch (event) {
>> +	case I2C_SLAVE_STOP:
>> +		command_size = panel->idx;
>> +		fallthrough;
>> +	case I2C_SLAVE_WRITE_REQUESTED:
>> +		panel->idx = 0;
>> +		break;
>> +	case I2C_SLAVE_WRITE_RECEIVED:
>> +		if (panel->idx < sizeof(panel->command))
>> +			panel->command[panel->idx++] = *val;
>> +		else
>> +			dev_dbg(&panel->input->dev, "command truncated\n");
> Just double checking: Do you really want to process truncated commands?
> Since you detect the state here, you could also choose to reject such
> commands?


Yes I suppose not. It could still be a valid command with extra bytes, 
but unlikely, so probably better not to handle it.


Thanks,

Eddie


>
