Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B912DF506
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Oct 2019 20:27:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46xlVW75dJzDqLM
	for <lists+linux-aspeed@lfdr.de>; Tue, 22 Oct 2019 05:27:31 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46xlVQ3sPtzDqKN
 for <linux-aspeed@lists.ozlabs.org>; Tue, 22 Oct 2019 05:27:25 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Oct 2019 11:27:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,324,1566889200"; d="scan'208";a="209421613"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.143])
 ([10.7.153.143])
 by orsmga002.jf.intel.com with ESMTP; 21 Oct 2019 11:27:23 -0700
Subject: Re: AST2600 i2c irq issue
To: Wolfram Sang <wsa@the-dreams.de>, Eddie James <eajames@linux.ibm.com>,
 Peter Rosin <peda@axentia.se>
References: <CACPK8XdqFkPgCQcgpM5C_YwfJ86Lmk=hG5zTcfbCDCMncXCJMg@mail.gmail.com>
 <f9fecc04-2a9a-4cbd-a1ff-ffb680b0fec2@linux.vnet.ibm.com>
 <dbb8635e-a95a-3951-cd65-3428adc461ec@linux.intel.com>
 <8c62b118777c44d1bf8e1a3c32175644@TWMBX02.aspeed.com>
 <20191021121629.GE1145@ninjato>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <cdc01cea-57a3-3b54-e3a1-44088c9120ed@linux.intel.com>
Date: Mon, 21 Oct 2019 11:27:23 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191021121629.GE1145@ninjato>
Content-Type: text/plain; charset=windows-1252; format=flowed
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Eddie James <eajames@linux.vnet.ibm.com>,
 Brendan Higgins <brendanhiggins@google.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 10/21/2019 5:16 AM, Wolfram Sang wrote:
> 
>>           spin_lock(&bus->lock);
>>           irq_received = readl(bus->base + ASPEED_I2C_INTR_STS_REG);
>> +       if (!irq_received)
>> +               return IRQ_NONE;
>> +
>>           /* Ack all interrupts except for Rx done */
>>           writel(irq_received & ~ASPEED_I2CD_INTR_RX_DONE,
>>                  bus->base + ASPEED_I2C_INTR_STS_REG);
>>
>>
>> I think it's a right fix for the issue. At least, we need to prevent
>> any driver state corruption. The state machine would run correctly if
>> we filtering the garbage interrupt out.
> 
> Just unlock the spinlock before you return...

Thanks Wolfram!

Peter also pointed it out, and Eddie made a patch which includes the
spin_unlock.

Hi Eddie,
Can you please submit your patch into 'i2c-next' upstream?

Thanks,

Jae
