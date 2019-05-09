Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E89218ED2
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 May 2019 19:19:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 450KpL2q8gzDqRJ
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 May 2019 03:19:38 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 450KpF5GBKzDq6K
 for <linux-aspeed@lists.ozlabs.org>; Fri, 10 May 2019 03:19:31 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 May 2019 10:19:28 -0700
X-ExtLoop1: 1
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.148])
 ([10.7.153.148])
 by orsmga007.jf.intel.com with ESMTP; 09 May 2019 10:19:30 -0700
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
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <bd909078-323e-93a6-143f-0bb0f0d2229c@linux.intel.com>
Date: Thu, 9 May 2019 10:19:28 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <b682cc6a480f2b8a5e14c5c001fa1927467d4e18.camel@kernel.crashing.org>
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

On 5/8/2019 7:16 PM, Benjamin Herrenschmidt wrote:
> On Wed, 2019-05-08 at 18:19 -0700, Jae Hyun Yoo wrote:
>> I changed that from a bool because the maintainer of this code, Eddie
>> doesn't like adding of an additional flag. I'll change it back with
>> codes in the first submit:
>> https://www.spinics.net/lists/linux-media/msg148955.html
>>
>> Eddie,
>> Please let me know if you have any objection on that.
> 
> Ok, so random flags ... ugh.
> 
> Well, you can approach it either way. Have them all be bitops or all be
> bool.
> 
> The tricky thing however is that if they are bitops you need to ensure
> that they are *all* manipulated under the same lock. If not you have to
> use the atomic bitops variants.
> 
> The reason I don't like that is that experience shows that most uses of
> such atomic variants in drivers usually are failed attempts at papering
> over broken locking.
> 
> If everything is covered by a lock, then using the non-atomic versions
> is more efficient, but so is using bool (optionally with :1 bitfield
> qualifiers to avoid wasting memory), which from a pure C language
> perspective I think is more expressive of what you are doing and more
> readable.

Okay. Probably I need to add one another patch in this series to address
what you pointed out.

I have one question. I reviewed again all bitops in this driver and
checked that some bitops are protected by a spinlock and some others
are not. In this case, can I mix use atomic and non-atomic bitops
depend on each bitop's protection state by the spinlock? Or, would it be
better to change all of them to bool in this case?

Thanks,
Jae

> 
> Cheers,
> Ben.
> 
