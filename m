Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B952FFB28
	for <lists+linux-aspeed@lfdr.de>; Fri, 22 Jan 2021 04:36:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DMQ136hqLzDrWZ
	for <lists+linux-aspeed@lfdr.de>; Fri, 22 Jan 2021 14:36:55 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=merlin.20170209 header.b=LvfVrjVA; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DMQ0q5DpDzDrR1
 for <linux-aspeed@lists.ozlabs.org>; Fri, 22 Jan 2021 14:36:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=M3pOp5kptZ6YgzfG0S1o6cFzqzbA+kUwayqUm25hHcM=; b=LvfVrjVA/4jzbyfI6AIhmS7+di
 aMB4ehdbvNADYyYINdG1nIbN8D8R5RIP2mIJhBgCEPa3B33AqGUIHDvX1WjwhprtQFKtdGZLmAhJp
 JTGUsZCgdWt+MVJ3UhpUahOJrIxZXM3d190SGF5Q7ORdrpbXMKCmABvLa+YnsrYzm3oMD3ejpbJIP
 12y83YrPLjX+YGZc0ZSXykJyHVD9pQLy0NMy8cOxosLO1D5MyCAjebN7Ma1EZjU86hu9+7XSFv06x
 5CkPaS4Kxe+isBaELueIr8pvwvSPpMjx3hJarXCauM6wcT4ddhgBRnbZ+CK1oJ8sUtrfEID9CnjG9
 9Ivb9mZg==;
Received: from [2601:1c0:6280:3f0::9abc]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2nFQ-00041g-Rz; Fri, 22 Jan 2021 03:36:33 +0000
Subject: Re: [PATCH] mmc: sdhci-of-aspeed: Fix kunit-related build error
To: Andrew Jeffery <andrew@aj.id.au>, linux-mmc@vger.kernel.org
References: <20210122032334.3663056-1-andrew@aj.id.au>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <fd80b74e-c6a0-9b84-1370-db0c0814dca6@infradead.org>
Date: Thu, 21 Jan 2021 19:36:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210122032334.3663056-1-andrew@aj.id.au>
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

On 1/21/21 7:23 PM, Andrew Jeffery wrote:
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

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks.

> ---
>  drivers/mmc/host/sdhci-of-aspeed-test.c |  9 ++++++++-
>  drivers/mmc/host/sdhci-of-aspeed.c      | 27 ++++++++++++++++++++-----
>  2 files changed, 30 insertions(+), 6 deletions(-)


-- 
~Randy
RFC: Features and documentation: http://lwn.net/Articles/260136/
