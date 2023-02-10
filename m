Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B8D691BDE
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Feb 2023 10:49:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCppk0G0Kz3f3Y
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Feb 2023 20:49:02 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=167.179.156.38; helo=formenos.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=<UNKNOWN>)
Received: from formenos.hmeau.com (167-179-156-38.a7b39c.syd.nbn.aussiebb.net [167.179.156.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCppd29lpz2yPY
	for <linux-aspeed@lists.ozlabs.org>; Fri, 10 Feb 2023 20:48:56 +1100 (AEDT)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1pQQ1K-009c7W-U8; Fri, 10 Feb 2023 17:48:44 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 10 Feb 2023 17:48:42 +0800
Date: Fri, 10 Feb 2023 17:48:42 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Neal Liu <neal_liu@aspeedtech.com>
Subject: Re: [RESENT PATCH v3 -next] crypto: aspeed: fix type warnings
Message-ID: <Y+YS+jnOZuK9yAmI@gondor.apana.org.au>
References: <20230203033512.980497-1-neal_liu@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230203033512.980497-1-neal_liu@aspeedtech.com>
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
Cc: linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Feb 03, 2023 at 11:35:12AM +0800, Neal Liu wrote:
> This patch fixes following warnings:
> 
> 1. sparse: incorrect type in assignment (different base types)
> Fix: change to __le32 type.
> 2. sparse: cast removes address space '__iomem' of expression
> Fix: use readb to avoid dereferencing the memory.
> 
> Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>
> ---
> Change since v2: remove unnecessary cast.
> Change since v1: keep iomem marker to remain its purpose.
> 
>  drivers/crypto/aspeed/aspeed-acry.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
