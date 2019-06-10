Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD513BA00
	for <lists+linux-aspeed@lfdr.de>; Mon, 10 Jun 2019 18:50:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45MzfK2V0PzDqPF
	for <lists+linux-aspeed@lfdr.de>; Tue, 11 Jun 2019 02:50:49 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="04Wa46m4"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45MzfD5MfKzDqDP
 for <linux-aspeed@lists.ozlabs.org>; Tue, 11 Jun 2019 02:50:44 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 09DC5206C3;
 Mon, 10 Jun 2019 16:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560185442;
 bh=IfkuH4QdGGwZoDp+X7T2nRPo/51iLlSiAiiHm/+uJjo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=04Wa46m4OqMS4nMsCoL6Kl0DCTHFMtKfZA/ilxstSrLFpFhir8DuX0YitoR+URRJc
 2Cb15xkPe9D7qIYa2Q3djy+4hYS7/hrxSnxJkx5hz4phfBKDjmd7jP+lFxKTTKeorI
 kyoWZRk93z+67h6eLwfe3/4+21AiROHdtIjbr6vc=
Date: Mon, 10 Jun 2019 18:50:40 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "sudheer.v" <open.sudheer@gmail.com>
Subject: Re: [patch 1/5] AST2500 DMA UART driver
Message-ID: <20190610165040.GB32085@kroah.com>
References: <1559737395-28542-1-git-send-email-open.sudheer@gmail.com>
 <1559737395-28542-2-git-send-email-open.sudheer@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1559737395-28542-2-git-send-email-open.sudheer@gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 sudheer.veliseti@aspeedtech.com, linux-aspeed@lists.ozlabs.org,
 shivahshankar.shankarnarayanrao@aspeedtech.com, robh+dt@kernel.org,
 linux-serial@vger.kernel.org, jslaby@suse.com, mchehab+samsung@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 sudheer Kumar veliseti <sudheer.open@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Jun 05, 2019 at 05:53:11PM +0530, sudheer.v wrote:
> +
> +#define CONFIG_UART_DMA_DEBUG
> +
> +#ifdef CONFIG_UART_DMA_DEBUG
> +#define UART_DBG(fmt, args...) pr_debug("%s() " fmt, __func__, ## args)
> +#else
> +#define UART_DBG(fmt, args...)
> +#endif
> +
> +#define  CONFIG_UART_TX_DMA_DEBUG 1
> +
> +#ifdef CONFIG_UART_TX_DMA_DEBUG
> +#define UART_TX_DBG(fmt, args...) pr_debug("%s()"fmt, __func__, ## args)
> +#else
> +#define UART_TX_DBG(fmt, args...)
> +#endif

Why have you left debugging on here?

Why does your tiny driver have custom debug macros?  Please always use
the in-kernel standard ones so you can dynamically enable/disable them
as needed without having to rebuild the code.

I stopped reading here, sorry.

greg k-h
