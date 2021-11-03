Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38921444BB0
	for <lists+linux-aspeed@lfdr.de>; Thu,  4 Nov 2021 00:34:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hl34r5XFSz2y7J
	for <lists+linux-aspeed@lfdr.de>; Thu,  4 Nov 2021 10:34:04 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hl34j2051z2x9j
 for <linux-aspeed@lists.ozlabs.org>; Thu,  4 Nov 2021 10:33:56 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10157"; a="231567775"
X-IronPort-AV: E=Sophos;i="5.87,207,1631602800"; d="scan'208";a="231567775"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2021 16:32:51 -0700
X-IronPort-AV: E=Sophos;i="5.87,207,1631602800"; d="scan'208";a="501303770"
Received: from yoojae-mobl.amr.corp.intel.com (HELO [10.212.171.79])
 ([10.212.171.79])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2021 16:32:49 -0700
Message-ID: <659f5704-6492-351d-94e3-2790e4b1748c@linux.intel.com>
Date: Wed, 3 Nov 2021 16:32:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] soc: aspeed: lpc-ctrl: Block error printing on probe
 defer cases
Content-Language: en-US
To: "Winiarska, Iwona" <iwona.winiarska@intel.com>,
 "Yoo, Jae Hyun" <jae.hyun.yoo@intel.com>,
 "yangyingliang@huawei.com" <yangyingliang@huawei.com>,
 "andrew@aj.id.au" <andrew@aj.id.au>,
 "chiawei_wang@aspeedtech.com" <chiawei_wang@aspeedtech.com>,
 "joel@jms.id.au" <joel@jms.id.au>
References: <20211103215430.192229-1-jae.hyun.yoo@intel.com>
 <7e0bcb8b36bd6af1cadd30a18bf5e28d48b80c0c.camel@intel.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
In-Reply-To: <7e0bcb8b36bd6af1cadd30a18bf5e28d48b80c0c.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 11/3/2021 4:05 PM, Winiarska, Iwona wrote:
> On Wed, 2021-11-03 at 14:54 -0700, jae.hyun.yoo@intel.com wrote:
>> From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>>
>> Add a checking code when it gets -EPROBE_DEFER while getting a clock
>> resource. In this case, it doesn't need to print out an error message
>> because the probing will be re-visited.
>>
>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> ---
>>   drivers/soc/aspeed/aspeed-lpc-ctrl.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/soc/aspeed/aspeed-lpc-ctrl.c b/drivers/soc/aspeed/aspeed-
>> lpc-ctrl.c
>> index 72771e018c42..e2262dbc7cf6 100644
>> --- a/drivers/soc/aspeed/aspeed-lpc-ctrl.c
>> +++ b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
>> @@ -307,8 +307,10 @@ static int aspeed_lpc_ctrl_probe(struct platform_device
>> *pdev)
>>   
>>          lpc_ctrl->clk = devm_clk_get(dev, NULL);
>>          if (IS_ERR(lpc_ctrl->clk)) {
>> -               dev_err(dev, "couldn't get clock\n");
>> -               return PTR_ERR(lpc_ctrl->clk);
>> +               rc = PTR_ERR(lpc_ctrl->clk);
>> +               if (rc != -EPROBE_DEFER)
>> +                       dev_err(dev, "couldn't get clock\n");
>> +               return rc;
>>          }
>>          rc = clk_prepare_enable(lpc_ctrl->clk);
>>          if (rc) {
> 
> This pattern should be handled using dev_err_probe()

Yes, that is a neater way. Will fix it using dev_err_probe().

Thanks,
Jae
