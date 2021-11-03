Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC9B4445BF
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 Nov 2021 17:17:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HksNd5PK8z2yPT
	for <lists+linux-aspeed@lfdr.de>; Thu,  4 Nov 2021 03:17:05 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HksNR2Kvgz2yL9
 for <linux-aspeed@lists.ozlabs.org>; Thu,  4 Nov 2021 03:16:53 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10157"; a="211589380"
X-IronPort-AV: E=Sophos;i="5.87,206,1631602800"; d="scan'208";a="211589380"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2021 09:15:51 -0700
X-IronPort-AV: E=Sophos;i="5.87,206,1631602800"; d="scan'208";a="450120981"
Received: from yoojae-mobl.amr.corp.intel.com (HELO [10.212.171.79])
 ([10.212.171.79])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2021 09:15:51 -0700
Message-ID: <2aeffcdf-0bb7-98f1-5d4e-909b7d86c44a@linux.intel.com>
Date: Wed, 3 Nov 2021 09:15:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH -next 3/4] ARM: dts: aspeed: add LCLK setting into LPC KCS
 nodes
Content-Language: en-US
To: Andrew Jeffery <andrew@aj.id.au>, Jae Hyun Yoo <jae.hyun.yoo@intel.com>,
 Rob Herring <robh+dt@kernel.org>, Corey Minyard <minyard@acm.org>,
 Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Haiyue Wang <haiyue.wang@linux.intel.com>
References: <20211101233751.49222-1-jae.hyun.yoo@intel.com>
 <20211101233751.49222-4-jae.hyun.yoo@intel.com>
 <372dc598-4ee0-482d-8d1a-ff34eb8cde7d@www.fastmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
In-Reply-To: <372dc598-4ee0-482d-8d1a-ff34eb8cde7d@www.fastmail.com>
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
Cc: devicetree@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 11/2/2021 3:22 PM, Andrew Jeffery wrote:
> 
> 
> On Tue, 2 Nov 2021, at 10:07, jae.hyun.yoo@intel.com wrote:
>> From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>>
>> Add LCLK clock setting into LPC KCS nodes to enable the LCLK by
>> individual LPC sub drivers.
>>
>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> 
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Thanks Andrew for your review!
