Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 68118E3BB8
	for <lists+linux-aspeed@lfdr.de>; Thu, 24 Oct 2019 21:03:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zc8j39STzDqXV
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Oct 2019 06:03:33 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zZq94FwLzDqZX
 for <linux-aspeed@lists.ozlabs.org>; Fri, 25 Oct 2019 05:03:16 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Oct 2019 11:03:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,225,1569308400"; d="scan'208";a="349783476"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.148])
 ([10.7.153.148])
 by orsmga004.jf.intel.com with ESMTP; 24 Oct 2019 11:03:13 -0700
Subject: Re: AST2600 i2c irq issue
To: Eddie James <eajames@linux.vnet.ibm.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Brendan Higgins <brendanhiggins@google.com>
References: <CACPK8XdqFkPgCQcgpM5C_YwfJ86Lmk=hG5zTcfbCDCMncXCJMg@mail.gmail.com>
 <f9fecc04-2a9a-4cbd-a1ff-ffb680b0fec2@linux.vnet.ibm.com>
 <dbb8635e-a95a-3951-cd65-3428adc461ec@linux.intel.com>
 <8c62b118777c44d1bf8e1a3c32175644@TWMBX02.aspeed.com>
 <333e959f-9296-b6d5-9442-b979a8abd50d@linux.vnet.ibm.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <5508f358-77b8-f5f7-2577-79da25e4e5ea@linux.intel.com>
Date: Thu, 24 Oct 2019 11:03:13 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <333e959f-9296-b6d5-9442-b979a8abd50d@linux.vnet.ibm.com>
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
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Eddie,

On 10/22/2019 1:24 PM, Eddie James wrote:

[...]

> 7: irq[00000000] before[rx] after[stop]

'irq[]' here and '10[]' below are the same register. This log means an
interrupt came with empty status.

>      00[00008001]
>      04[007ee005]
>      08[00000000]
>      0c[0000607f]
>      10[00000004]    <<< this is interesting. this has changed since the 
> start of the interrupt handler.

The interrupt status was updated lately at here. Looks like there is a
timing gap in H/W between interrupt triggering and status updating. I
haven't seen this issue in previous H/W versions.

This issue can be resolved by your patch but ultimately this issue
should be fixed in AST2600 A1 revision H/W if possible so that we can
remove the unnecessary interrupt handling.

Thanks,

Jae
