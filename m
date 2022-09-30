Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E21ED5F0462
	for <lists+linux-aspeed@lfdr.de>; Fri, 30 Sep 2022 07:57:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdzyM0Q18z3c6Y
	for <lists+linux-aspeed@lfdr.de>; Fri, 30 Sep 2022 15:56:59 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=216.24.177.18; helo=fornost.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=<UNKNOWN>)
Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdzyG03Lnz305X
	for <linux-aspeed@lists.ozlabs.org>; Fri, 30 Sep 2022 15:56:50 +1000 (AEST)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
	by fornost.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1oe90W-00A4qx-Np; Fri, 30 Sep 2022 15:56:21 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Fri, 30 Sep 2022 13:56:20 +0800
Date: Fri, 30 Sep 2022 13:56:20 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: shangxiaojing <shangxiaojing@huawei.com>
Subject: Re: [PATCH -next] crypto: aspeed - Remove redundant dev_err call
Message-ID: <YzaFBPVtJT4hMCvw@gondor.apana.org.au>
References: <20220923100159.15705-1-shangxiaojing@huawei.com>
 <HK0PR06MB320294D6E2A61F85F4276EE780519@HK0PR06MB3202.apcprd06.prod.outlook.com>
 <afde3f5c-32e4-6b89-8d6b-1f4f5a7744c4@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afde3f5c-32e4-6b89-8d6b-1f4f5a7744c4@huawei.com>
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, Neal Liu <neal_liu@aspeedtech.com>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, "davem@davemloft.net" <davem@davemloft.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Sep 23, 2022 at 08:26:21PM +0800, shangxiaojing wrote:
> 
> On 2022/9/23 18:15, Neal Liu wrote:
> > > devm_ioremap_resource() prints error message in itself. Remove the dev_err
> > > call to avoid redundant error message.
> > > 
> > > Signed-off-by: Shang XiaoJing <shangxiaojing@huawei.com>
> > > ---
> > >   drivers/crypto/aspeed/aspeed-hace.c | 4 +---
> > >   1 file changed, 1 insertion(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/crypto/aspeed/aspeed-hace.c
> > > b/drivers/crypto/aspeed/aspeed-hace.c
> > > index 3f880aafb6a2..e05c32c31842 100644
> > > --- a/drivers/crypto/aspeed/aspeed-hace.c
> > > +++ b/drivers/crypto/aspeed/aspeed-hace.c
> > > @@ -123,10 +123,8 @@ static int aspeed_hace_probe(struct platform_device
> > > *pdev)
> > >   	platform_set_drvdata(pdev, hace_dev);
> > > 
> > >   	hace_dev->regs = devm_ioremap_resource(&pdev->dev, res);
> > > -	if (IS_ERR(hace_dev->regs)) {
> > > -		dev_err(&pdev->dev, "Failed to map resources\n");
> > > +	if (IS_ERR(hace_dev->regs))
> > >   		return PTR_ERR(hace_dev->regs);
> > > -	}
> > > 
> > >   	/* Get irq number and register it */
> > >   	hace_dev->irq = platform_get_irq(pdev, 0);
> > > --
> > > 2.17.1
> > Similar patch just be proposed few days ago.
> > https://patchwork.kernel.org/project/linux-crypto/patch/20220920032118.6440-1-yuehaibing@huawei.com/
> 
> sorry, pls ignore mine.

Actually I think these two patches are different and both can be
applied.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
