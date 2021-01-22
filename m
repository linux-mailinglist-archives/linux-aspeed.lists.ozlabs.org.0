Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDC430099B
	for <lists+linux-aspeed@lfdr.de>; Fri, 22 Jan 2021 18:23:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DMmLz2n8czDrp6
	for <lists+linux-aspeed@lfdr.de>; Sat, 23 Jan 2021 04:23:39 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=merlin.20170209 header.b=RO/x/RV5; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DMmLn2FvCzDrp4
 for <linux-aspeed@lists.ozlabs.org>; Sat, 23 Jan 2021 04:23:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=/1OGUuSh8UTx2h39ipHbvJAcdb29iqtzaaFfOzJpWBw=; b=RO/x/RV5jTG78QmHWtQlBG20gp
 ZqwEdo8lONzmuAiGidQusdA8sq3W+YGFl8SuNvBGH31iPg6tz/lerRjZopvE7zEuUqCN+Xe+DgUyP
 Nr3v1wFNvah06wJtgmvEe2itJg5sdFOjSKvo2i4EpCY4Jrjp6/grhdTSV2PdYXYlmKLtFPv8Y+3mE
 mNfzX+Q4rRBH0PfKacJf+ovfim35xemVvVAkr4FRE3sLqJdkv0UNcXoahP5r4xOgAo1PkufxRZJOF
 pM9F/+gwhecuJt7fnNODh8MBfpH3orJfykRo3T/hPF0/XPh1T/x4zgcD7Sf+5RqDJ06jz8vF+dLHD
 SXfIhUfg==;
Received: from [2601:1c0:6280:3f0::9abc]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l309X-00039n-GX; Fri, 22 Jan 2021 17:23:19 +0000
Subject: Re: [PATCH v2] mmc: sdhci-of-aspeed: Fix kunit-related build error
To: Andrew Jeffery <andrew@aj.id.au>, linux-mmc@vger.kernel.org
References: <20210122114852.3790565-1-andrew@aj.id.au>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <bef54bf0-7c9e-09ce-9f37-ab9498959ba1@infradead.org>
Date: Fri, 22 Jan 2021 09:23:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210122114852.3790565-1-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8
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
Cc: ulf.hansson@linaro.org, linux-aspeed@lists.ozlabs.org,
 brendanhiggins@google.com, linux-kernel@vger.kernel.org,
 adrian.hunter@intel.com, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 1/22/21 3:48 AM, Andrew Jeffery wrote:
> Randy found that with the following Kconfig settings we have duplicate
> definitions (e.g. __inittest()) in sdhci-of-aspeed due to competing
> module_init()/module_exit() calls from kunit and driver the itself.
> 
> ```
> CONFIG_MMC_SDHCI_OF_ASPEED=m
> CONFIG_MMC_SDHCI_OF_ASPEED_TEST=y
> ```
> 
> Conditionally open-code the kunit initialisation to avoid the error.
> 
> Fixes: 7efa02a981d6 ("mmc: sdhci-of-aspeed: Add KUnit tests for phase calculations")
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
> 
> v2:
> * Collapse the #ifdef-ery
> 
>  drivers/mmc/host/sdhci-of-aspeed-test.c |  9 +++++-
>  drivers/mmc/host/sdhci-of-aspeed.c      | 42 ++++++++++++++++++++++---
>  2 files changed, 45 insertions(+), 6 deletions(-)

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks.


-- 
~Randy

