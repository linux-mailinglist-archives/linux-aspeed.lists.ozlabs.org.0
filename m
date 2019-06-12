Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3B442BDC
	for <lists+linux-aspeed@lfdr.de>; Wed, 12 Jun 2019 18:13:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45PBkT3WcRzDr42
	for <lists+linux-aspeed@lfdr.de>; Thu, 13 Jun 2019 02:13:37 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45PBkG0KD9zDr0l
 for <linux-aspeed@lists.ozlabs.org>; Thu, 13 Jun 2019 02:13:24 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Jun 2019 09:13:20 -0700
X-ExtLoop1: 1
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.151])
 ([10.7.153.151])
 by orsmga001.jf.intel.com with ESMTP; 12 Jun 2019 09:13:20 -0700
Subject: Re: [PATCH v3 10/10] media: aspeed: add a workaround to fix a silicon
 bug
To: Eddie James <eajames@linux.vnet.ibm.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Eddie James <eajames@linux.ibm.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
References: <20190531221548.14757-1-jae.hyun.yoo@linux.intel.com>
 <20190531221548.14757-11-jae.hyun.yoo@linux.intel.com>
 <38a8ca27-9991-fe8c-4d89-abdaacd4130b@linux.intel.com>
 <490d6111-32c1-f8f4-dc3c-39314446709e@xs4all.nl>
 <7486bdf6-8ab1-4e96-d5ca-b1b0f018af6b@linux.vnet.ibm.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <cae799c1-0e10-791c-a74b-66bafd39184e@linux.intel.com>
Date: Wed, 12 Jun 2019 09:13:20 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <7486bdf6-8ab1-4e96-d5ca-b1b0f018af6b@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-aspeed@lists.ozlabs.org,
 linux-media@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 6/12/2019 8:03 AM, Eddie James wrote:
> 
> On 6/12/19 2:17 AM, Hans Verkuil wrote:
>> Eddie: ping!
>>
>> Regards,
>>
>>     Hans
>>
>> On 6/6/19 2:53 AM, Jae Hyun Yoo wrote:
>>> Hi Eddie,
>>>
>>> All patches in this series were queued to linux/media tree except this
>>> one. Can you please review this patch?
>>>
>>> Thanks,
>>> Jae
>>>
>>> On 5/31/2019 3:15 PM, Jae Hyun Yoo wrote:
>>>> AST2500 silicon revision A1 and A2 have a silicon bug which causes
>>>> extremly long capturing time on specific resolutions (1680 width).
>>>> To fix the bug, this commit adjusts the capturing window register
>>>> setting to 1728 if detected width is 1680. The compression window
>>>> register setting will be kept as the original width so output
>>>> result will be the same.

Hi Hans,

Can you please fix a typo in the commit message when you queue this
patch? Thanks in advance!

s/extremly/extremely/g

> 
> 
> Sorry, missed your followup email Jae and assumed everything was merged.
> 
> 
> Looks fine to me.
> 
> Reviewed-by: Eddie James <eajames@linux.ibm.com>

Thanks for your review Eddie!

Regards,
Jae
