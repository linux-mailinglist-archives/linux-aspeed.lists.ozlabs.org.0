Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB0313CE0B
	for <lists+linux-aspeed@lfdr.de>; Wed, 15 Jan 2020 21:21:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ydym6D53zDqSw
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Jan 2020 07:21:52 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ydyW6RllzDqQm
 for <linux-aspeed@lists.ozlabs.org>; Thu, 16 Jan 2020 07:21:37 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Jan 2020 12:21:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,323,1574150400"; d="scan'208";a="225710570"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.147])
 ([10.7.153.147])
 by orsmga003.jf.intel.com with ESMTP; 15 Jan 2020 12:21:33 -0800
Subject: Re: [PATCH] clk: ast2600: enable BCLK for PCI/PCIe bus always
To: Joel Stanley <joel@jms.id.au>
References: <20200113213453.27108-1-jae.hyun.yoo@linux.intel.com>
 <CACPK8Xf0Oa62BsNOQ55rqAp_a=V-_9bm1c4nu_+Oo5zB=2+zpA@mail.gmail.com>
 <255b53d2-d4b5-8bc0-393b-a2f531a98fc1@linux.intel.com>
 <CACPK8XfevBQxdAanN5QjiUv8KKevetjKP7cbr3tuL=mrULjttg@mail.gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <794bcd23-185a-08c1-cdb1-9d7ca65bcb1e@linux.intel.com>
Date: Wed, 15 Jan 2020 12:21:33 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XfevBQxdAanN5QjiUv8KKevetjKP7cbr3tuL=mrULjttg@mail.gmail.com>
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
Cc: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 1/14/2020 9:43 PM, Joel Stanley wrote:
> On Tue, 14 Jan 2020 at 19:53, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>>
>> Hi Joel,
>>
>> On 1/13/2020 10:15 PM, Joel Stanley wrote:
>>> On Mon, 13 Jan 2020 at 21:33, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>>>>
>>>> BCLK for PCI/PCIe bus should be enabled always with having the
>>>> CLK_IS_CRITICAL flag otherwise it will be disabled at kernel late
>>>> initcall phase as an unused clock, and eventually it causes
>>>> unexpected behavior on BMC features that are connected to the host
>>>> through PCI/PCIe bus.
>>>
>>> This is true for systems that have PCIe connected. There are systems
>>> that do not, and in that case we don't want to have the clock enabled.
>>>
>>> Are you doing this to support the case where the PCIe device not load
>>> a BMC driver? (eg for host VGA use). If not, then you can have the
>>> driver you're loading request the BCLK.
>>>
>>> If this is for the host VGA device, then you will need to come up with
>>> a mechanism that makes the enabling of this clock depend on the device
>>> tree.
>>
>> Is there any way to enable clock by just adding a node in device tree?
>> Do you want me to add a simple driver module for host VGA just for
>> enabling BCLK?
> 
> Okay, so this is for the case where we lack a BMC driver.
> 
> One option would be to do as you suggest, adding a simple driver that
> claims essential clocks.
> 
> Another could be to add some extra properties that clock driver parses
> and enables the clocks.
> 

Looks like it needs changes in clk-ast2600 module for checking of
'clock-critical' device tree property. Let me try to make it.

Thanks,
Jae
