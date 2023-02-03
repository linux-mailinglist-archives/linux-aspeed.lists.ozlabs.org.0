Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F57688CE2
	for <lists+linux-aspeed@lfdr.de>; Fri,  3 Feb 2023 03:08:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7Jw238hhz3f65
	for <lists+linux-aspeed@lfdr.de>; Fri,  3 Feb 2023 13:08:02 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=gondor.apana.org.au (client-ip=167.179.156.38; helo=formenos.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=<UNKNOWN>)
X-Greylist: delayed 934 seconds by postgrey-1.36 at boromir; Fri, 03 Feb 2023 13:07:58 AEDT
Received: from formenos.hmeau.com (167-179-156-38.a7b39c.syd.nbn.aussiebb.net [167.179.156.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7Jvy4p7Gz3bP0
	for <linux-aspeed@lists.ozlabs.org>; Fri,  3 Feb 2023 13:07:58 +1100 (AEDT)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1pNlFB-006zOy-QO; Fri, 03 Feb 2023 09:52:02 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 03 Feb 2023 09:52:01 +0800
Date: Fri, 3 Feb 2023 09:52:01 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Dhananjay Phadke <dphadke@linux.microsoft.com>
Subject: Re: [PATCH v2 -next] crypto: aspeed: fix type warnings
Message-ID: <Y9xowUpO+Y7M0hho@gondor.apana.org.au>
References: <20230202070345.191514-1-neal_liu@aspeedtech.com>
 <e2dd4a02-12cb-de5e-4b64-9d6a4a1ad316@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2dd4a02-12cb-de5e-4b64-9d6a4a1ad316@linux.microsoft.com>
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
Cc: linux-aspeed@lists.ozlabs.org, Neal Liu <neal_liu@aspeedtech.com>, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Feb 02, 2023 at 05:36:05PM -0800, Dhananjay Phadke wrote:
>
> > diff --git a/drivers/crypto/aspeed/aspeed-acry.c b/drivers/crypto/aspeed/aspeed-acry.c
> > index 164c524015f0..f2429e699d14 100644
> > --- a/drivers/crypto/aspeed/aspeed-acry.c
> > +++ b/drivers/crypto/aspeed/aspeed-acry.c
> > @@ -252,7 +252,7 @@ static int aspeed_acry_rsa_ctx_copy(struct aspeed_acry_dev *acry_dev, void *buf,
> >   				    enum aspeed_rsa_key_mode mode)
> >   {
> >   	const u8 *src = xbuf;
> > -	u32 *dw_buf = (u32 *)buf;
> > +	__le32 *dw_buf = (__le32 *)buf;
> 
> All callers are passing acry_dev->buf_addr as buf, can just change that type
> to __le32 * and deref here directly?

As buf is already void *, the cast can simply be removed.
> 
> >   	int nbits, ndw;
> >   	int i, j, idx;
> >   	u32 data = 0;
> > @@ -302,7 +302,7 @@ static int aspeed_acry_rsa_ctx_copy(struct aspeed_acry_dev *acry_dev, void *buf,
> >   static int aspeed_acry_rsa_transfer(struct aspeed_acry_dev *acry_dev)
> >   {
> >   	struct akcipher_request *req = acry_dev->req;
> > -	u8 *sram_buffer = (u8 *)acry_dev->acry_sram;
> > +	u8 __iomem *sram_buffer = (u8 __iomem *)acry_dev->acry_sram;
> 
> u8 cast seems unnecessary, readb takes (void *) and using "+ data_idx"
> offset below anyway.

Either way a cast is unnecessary as (void __iomem *) converts to
(u8 __iomem *) just fine.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
