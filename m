Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D5E1978A
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 May 2019 06:28:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 450cdq3B4czDqHY
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 May 2019 14:28:15 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 450cdj3m8VzDq5k
 for <linux-aspeed@lists.ozlabs.org>; Fri, 10 May 2019 14:28:07 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 May 2019 21:28:04 -0700
X-ExtLoop1: 1
Received: from dgmorgan-mobl2.amr.corp.intel.com (HELO [10.254.7.87])
 ([10.254.7.87])
 by fmsmga001.fm.intel.com with ESMTP; 09 May 2019 21:28:04 -0700
Subject: Re: [PATCH 1/7] media: aspeed: fix a kernel warning on clk control
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Eddie James <eajames@linux.ibm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
References: <20190502191317.29698-1-jae.hyun.yoo@linux.intel.com>
 <20190502191317.29698-2-jae.hyun.yoo@linux.intel.com>
 <1ec7397cb164b40877839bbc90f79b5942675fdb.camel@kernel.crashing.org>
 <6e93467e-1556-3cfd-b15c-c12b6907f526@linux.intel.com>
 <3b4269d829467870f0b6adac18089b93114fcd3c.camel@kernel.crashing.org>
 <3786afed-c34d-e3f0-4cd5-620185807091@linux.intel.com>
 <b682cc6a480f2b8a5e14c5c001fa1927467d4e18.camel@kernel.crashing.org>
 <bd909078-323e-93a6-143f-0bb0f0d2229c@linux.intel.com>
 <9b9f9e0d8fdeef0749fa5fcef1647216e9a74f8c.camel@kernel.crashing.org>
 <2f21bac3-7095-a535-e964-ae24ae6e021d@linux.intel.com>
 <1b208c6b78107aeca7b68fb496466e92957b935a.camel@kernel.crashing.org>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <2c1ee4fd-5f88-1254-608b-73ded050d3a6@linux.intel.com>
Date: Thu, 9 May 2019 21:28:05 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <1b208c6b78107aeca7b68fb496466e92957b935a.camel@kernel.crashing.org>
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
Cc: linux-aspeed@lists.ozlabs.org, linux-media@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 5/9/2019 8:01 PM, Benjamin Herrenschmidt wrote:
> On Thu, 2019-05-09 at 16:51 -0700, Jae Hyun Yoo wrote:
>> On 5/9/2019 4:19 PM, Benjamin Herrenschmidt wrote:
>>> On Thu, 2019-05-09 at 10:19 -0700, Jae Hyun Yoo wrote:
>>>>
>>>> Okay. Probably I need to add one another patch in this series to
>>>> address
>>>> what you pointed out.
>>>>
>>>> I have one question. I reviewed again all bitops in this driver
>>>> and
>>>> checked that some bitops are protected by a spinlock and some
>>>> others
>>>> are not. In this case, can I mix use atomic and non-atomic bitops
>>>> depend on each bitop's protection state by the spinlock? Or,
>>>> would it be
>>>> better to change all of them to bool in this case?
>>>
>>> No, if some aren't protected by a lock and some are, then they need
>>> to
>>> remain atomic.
>>>
>>> The question then becomes whether the unprotected ones are actually
>>> correct or just exposing more races.
>>
>> Got it. Not sure yet but I think the protected bitops could be moved
>> out
>> from the spinlock scope then all bitops could be kept as atomic.
> 
> Which is very likely to be extremely racy... (and gratuitously more
> costly) :-)

Okay then, will try to wrap all bitops using a single spinlock and
change all of them to non-atomic bitops. Is it right approach?

Thanks,
Jae

>>   I'll
>> look at and test this driver code more deeply again, and will submit
>> v2
>> soon.
>>
>> Again, thanks a lot for your review.
>>
>> Regards,
>> Jae
> 
