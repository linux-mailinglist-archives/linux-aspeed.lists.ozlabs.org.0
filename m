Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBC4442475
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Nov 2021 01:00:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hjqlz3L0rz2y7H
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Nov 2021 11:00:15 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hjqlw2jLjz2xCM
 for <linux-aspeed@lists.ozlabs.org>; Tue,  2 Nov 2021 11:00:11 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10155"; a="211201537"
X-IronPort-AV: E=Sophos;i="5.87,201,1631602800"; d="scan'208";a="211201537"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2021 16:59:09 -0700
X-IronPort-AV: E=Sophos;i="5.87,201,1631602800"; d="scan'208";a="540611623"
Received: from yoojae-mobl.amr.corp.intel.com (HELO [10.212.215.227])
 ([10.212.215.227])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2021 16:59:09 -0700
Message-ID: <9857f68a-365d-e569-b083-85c10edf9bba@linux.intel.com>
Date: Mon, 1 Nov 2021 16:59:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH -next 1/4] ARM: dts: aspeed: add LCLK setting into LPC IBT
 node
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
References: <20211101233751.49222-1-jae.hyun.yoo@intel.com>
 <20211101233751.49222-2-jae.hyun.yoo@intel.com>
 <CACPK8XcAN-SsKDS2E_Cnv=5-Rq=9sAWYyb88i2Ub-iX0WH6aZw@mail.gmail.com>
 <3b90b836-d35f-fe98-69b1-69ebcecf54ea@linux.intel.com>
 <CACPK8XcR0zR10_dPOM0atyqU3TarkWZ9N4r0B94N56_gebjJaw@mail.gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
In-Reply-To: <CACPK8XcR0zR10_dPOM0atyqU3TarkWZ9N4r0B94N56_gebjJaw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Corey Minyard <minyard@acm.org>,
 Rob Herring <robh+dt@kernel.org>, Jae Hyun Yoo <jae.hyun.yoo@intel.com>,
 Cedric Le Goater <clg@kaod.org>, openipmi-developer@lists.sourceforge.net,
 Haiyue Wang <haiyue.wang@linux.intel.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 11/1/2021 4:52 PM, Joel Stanley wrote:
> On Mon, 1 Nov 2021 at 23:48, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>>
>>> Reviewed-by: Joel Stanley <joel@jms.id.au>
>>>
>>> Do you need to update the bindings too?
>>
>> Hi Joel,
>>
>> Right, I have to update 'aspeed,ast2400-ibt-bmc.txt'. Will add update
>> in v2. Thanks a lot for your review and for reminding me. :)
> 
> Note that they've moved to Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml
> 
> You can find this commit in linux-next.
> 

Got it. Thanks again!
