Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAC3DCA50
	for <lists+linux-aspeed@lfdr.de>; Fri, 18 Oct 2019 18:07:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vrXn3KcKzDrT3
	for <lists+linux-aspeed@lfdr.de>; Sat, 19 Oct 2019 03:07:53 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vrXd30M8zDqbs
 for <linux-aspeed@lists.ozlabs.org>; Sat, 19 Oct 2019 03:07:43 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Oct 2019 09:07:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,312,1566889200"; d="scan'208";a="199748833"
Received: from unknown (HELO [10.7.153.143]) ([10.7.153.143])
 by orsmga003.jf.intel.com with ESMTP; 18 Oct 2019 09:07:40 -0700
Subject: Re: AST2600 i2c irq issue
To: Peter Rosin <peda@axentia.se>, Eddie James <eajames@linux.vnet.ibm.com>,
 Joel Stanley <joel@jms.id.au>, Brendan Higgins <brendanhiggins@google.com>
References: <CACPK8XdqFkPgCQcgpM5C_YwfJ86Lmk=hG5zTcfbCDCMncXCJMg@mail.gmail.com>
 <f9fecc04-2a9a-4cbd-a1ff-ffb680b0fec2@linux.vnet.ibm.com>
 <dbb8635e-a95a-3951-cd65-3428adc461ec@linux.intel.com>
 <b2149b86-56c7-dee7-2ea7-49f8837534b0@axentia.se>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <672b0fd5-6b19-32e9-5c0a-3153732353d8@linux.intel.com>
Date: Fri, 18 Oct 2019 09:07:40 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b2149b86-56c7-dee7-2ea7-49f8837534b0@axentia.se>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 10/17/2019 9:28 PM, Peter Rosin wrote:
> On 2019-10-18 00:29, Jae Hyun Yoo wrote:
>> On 10/17/2019 1:31 PM, Eddie James wrote:
>>> I was also able to "fix" this by simple returning IRQ_NONE if irq_status
>>> == 0 in the interrupt handler. But probably not a good solution.
>>
>> A fix like below, right?
>>
>> @@ -603,6 +603,9 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void
>> *dev_id)
>>
>>           spin_lock(&bus->lock);
>>           irq_received = readl(bus->base + ASPEED_I2C_INTR_STS_REG);
>> +       if (!irq_received)
>> +               return IRQ_NONE;
>> +
> 
> Don't forget spin_unlock(&bus->lock);

Ah, I missed that. Thanks for your pointing out.

Cheers,

Jae
