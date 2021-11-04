Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 03473445707
	for <lists+linux-aspeed@lfdr.de>; Thu,  4 Nov 2021 17:18:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HlTMH6wpgz2yWG
	for <lists+linux-aspeed@lfdr.de>; Fri,  5 Nov 2021 03:18:03 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HlTMD5GCQz2xXm
 for <linux-aspeed@lists.ozlabs.org>; Fri,  5 Nov 2021 03:18:00 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10157"; a="212483019"
X-IronPort-AV: E=Sophos;i="5.87,209,1631602800"; d="scan'208";a="212483019"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2021 09:16:58 -0700
X-IronPort-AV: E=Sophos;i="5.87,209,1631602800"; d="scan'208";a="468521539"
Received: from yoojae-mobl.amr.corp.intel.com (HELO [10.209.121.122])
 ([10.209.121.122])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2021 09:16:57 -0700
Message-ID: <27c6e902-7cb3-97c6-f4db-b31a81869115@linux.intel.com>
Date: Thu, 4 Nov 2021 09:16:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH -next v2 5/6] dt-bindings: ipmi: aspeed,kcs-bmc: add
 'clocks' as a required property
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
References: <20211102203717.96794-1-jae.hyun.yoo@intel.com>
 <20211102203717.96794-6-jae.hyun.yoo@intel.com>
 <1635902437.654631.3880388.nullmailer@robh.at.kernel.org>
 <8db279c9-4c76-91a5-3617-a17effb2d103@linux.intel.com>
 <CAL_Jsq+SwCqFycKz4+agRsB3qr4Rbfra55Q6tNbMH2bNtoX+hA@mail.gmail.com>
 <796e0c02-5bca-e8a9-a17f-898aafec237f@linux.intel.com>
 <CACPK8Xcwkz1QLOvN0MiSkX+jj2NZY10--1qo7M8UMyEmQQtYmA@mail.gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
In-Reply-To: <CACPK8Xcwkz1QLOvN0MiSkX+jj2NZY10--1qo7M8UMyEmQQtYmA@mail.gmail.com>
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
Cc: Rob Herring <robh@kernel.org>, Corey Minyard <minyard@acm.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 devicetree <devicetree@vger.kernel.org>, Jae Hyun Yoo <jae.hyun.yoo@intel.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 openipmi-developer@lists.sourceforge.net,
 Haiyue Wang <haiyue.wang@linux.intel.com>, Cedric Le Goater <clg@kaod.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 11/3/2021 3:45 PM, Joel Stanley wrote:
> On Wed, 3 Nov 2021 at 17:27, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>>
>> On 11/3/2021 9:29 AM, Rob Herring wrote:
> 
>>> It's possible that 'clocks' was always required or that it never
>>> worked without clocks, then this change is okay. Looking at this
>>> patch, I have no way to know that. The commit message has to explain
>>> that. A commit message needs to answer WHY are you making the change.
>>> You don't really need WHAT the change is as anyone can read the diff.
>>
>> Then what would be better? Would it be good enough if I add more detail
>> commit message including a note that dtb recompiling is required? Or,
>> should I change this series to treat the 'clocks' as an optional
>> property? Can you please share your thought?
> 
> Make it essential. It was only by accident that things have worked
> without this change.
> 
> While keeping backwards compatibility with dtbs is a goal we strive
> for, in practice we use the dtb from the corresponding kernel source
> tree, so as long as the patch to the driver is applied in the same
> place as the patch to the device tree no systems will break.

Okay. I'll keep 'clocks' property as a required property and will make
the commit message of this patch more descriptive. Thanks a lot for your
feedback.

Cheers,
Jae

