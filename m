Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C095A7355
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Aug 2022 03:27:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHRPH4v1tz3br0
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Aug 2022 11:27:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HxFupa1n;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1136; helo=mail-yw1-x1136.google.com; envelope-from=sudipm.mukherjee@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HxFupa1n;
	dkim-atps=neutral
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGRwh6KYgz30Bl
	for <linux-aspeed@lists.ozlabs.org>; Mon, 29 Aug 2022 20:47:48 +1000 (AEST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-33da3a391d8so185109227b3.2
        for <linux-aspeed@lists.ozlabs.org>; Mon, 29 Aug 2022 03:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=kSieKOlo1/WXICMwAgDNVpDovck1uNqjYZr77DgkzKg=;
        b=HxFupa1nz/7jnMJaXoUkalkcUiimSoG9gFuCoxaCaUCWO1XeKfJjotPNX/ld43NZV+
         xb9fofqFTbBB/m57w3kc8/VpE5FHKXIpTiXitBbscwLOjUS+PcSwh4B7+pVwnlHb6Ixr
         OyAlUxp49g5ZsZD2zR0yZf7syBmJ/2d249ax05/nlTgDAm6W2Z9gpIfJEGwkpHv4VmfE
         f6cOwXn93ePgjvTfxkoMmFn/GJ3OUTW6MPTmRn2qmv1sW77uoO/ZNnS0+beMWIFga/a6
         cQ6vB+lbrghQ1z5y5NmzA9xjtjl1UL3VW7hJ1hW/lM5PtNhIZ6tewoBopKHTFPn0J2Xm
         te3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=kSieKOlo1/WXICMwAgDNVpDovck1uNqjYZr77DgkzKg=;
        b=1Rzi+t56QELIVxsXR5DKAyo+jTprP9OINWJdBvVSQOKMraMtXF/OnZtwJBK3+depSM
         VjQ1g4ycNy58kI1KzCZQtfbuUNyysUPy3D2XRy6g1YeUAu6na+Q2DX3Pcb/Sqcrxflyc
         ZrzNT+gyfSTr53J25LD3Gud0TAmGZ3SnfKW0aoD1RKwB+Ma8a8Pl3UPq64W6zaS2pEdF
         +BlwKgBi+UiS3avbCK9UFASgb96rX4rCt7/rzVpp/ygH1Xw5mEd0UeMZkIoIRFewYon4
         BMosnomgB6bIEXVdGWwy3qvRCdxkr0DT9E0caV9MZOTJWBYKZA7dROKh2piOwGm3CByI
         S/JQ==
X-Gm-Message-State: ACgBeo1D80yiIhcsZ1ifc0E7Wy/5DIWVf22Mm+lc8rQKXJY0jHW7fFMw
	UT5D7VqvZzrsa+2Fu6zxzTkGtx+bPTAXUcRFwxg=
X-Google-Smtp-Source: AA6agR6JcTZw4epIOLkyhUxCjBwgxCGzrkYktQOOZ2cfKa/x8rbYWOImx4JDCrqVO/hXWrcwsNVGLCJpt6uwMl3sqlw=
X-Received: by 2002:a81:7882:0:b0:339:802b:b4c0 with SMTP id
 t124-20020a817882000000b00339802bb4c0mr9521292ywc.488.1661770064718; Mon, 29
 Aug 2022 03:47:44 -0700 (PDT)
MIME-Version: 1.0
References: <YwyORp72cuDrVYdA@debian> <TY2PR06MB321356F6EB09D3D59D37B53F80769@TY2PR06MB3213.apcprd06.prod.outlook.com>
In-Reply-To: <TY2PR06MB321356F6EB09D3D59D37B53F80769@TY2PR06MB3213.apcprd06.prod.outlook.com>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Mon, 29 Aug 2022 11:47:08 +0100
Message-ID: <CADVatmMevKbZ+gHfG-7kuy3s=K2_Qe1OOVrL92OUiTMeoK7ViA@mail.gmail.com>
Subject: Re: build failure of next-20220829 due to 108713a713c7 ("crypto:
 aspeed - Add HACE hash driver")
To: Neal Liu <neal_liu@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 31 Aug 2022 11:27:25 +1000
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
Cc: Johnny Huang <johnny_huang@aspeedtech.com>, Herbert Xu <herbert@gondor.apana.org.au>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Aug 29, 2022 at 11:04 AM Neal Liu <neal_liu@aspeedtech.com> wrote:
>
> > -----Original Message-----
> > From: Sudip Mukherjee (Codethink) <sudipm.mukherjee@gmail.com>
> > Sent: Monday, August 29, 2022 6:01 PM
> > To: Neal Liu <neal_liu@aspeedtech.com>; Johnny Huang
> > <johnny_huang@aspeedtech.com>; Dhananjay Phadke
> > <dphadke@linux.microsoft.com>; Herbert Xu <herbert@gondor.apana.org.au>
> > Cc: David S. Miller <davem@davemloft.net>; Joel Stanley <joel@jms.id.au>;
> > Andrew Jeffery <andrew@aj.id.au>; linux-aspeed@lists.ozlabs.org;
> > linux-crypto@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > linux-kernel@vger.kernel.org; linux-next@vger.kernel.org
> > Subject: build failure of next-20220829 due to 108713a713c7 ("crypto: aspeed
> > - Add HACE hash driver")
> >
> > Hi All,
> >
> > The builds of arm allmodconfig have failed to build next-20220829 with the
> > error:
> >
> > ERROR: modpost: "aspeed_register_hace_hash_algs"
> > [drivers/crypto/aspeed/aspeed_crypto.ko] undefined!
> > ERROR: modpost: "aspeed_unregister_hace_crypto_algs"
> > [drivers/crypto/aspeed/aspeed_crypto.ko] undefined!
> > ERROR: modpost: "aspeed_register_hace_crypto_algs"
> > [drivers/crypto/aspeed/aspeed_crypto.ko] undefined!
> > ERROR: modpost: "aspeed_unregister_hace_hash_algs"
> > [drivers/crypto/aspeed/aspeed_crypto.ko] undefined!
> >
> >
> > git bisect pointed to 108713a713c7 ("crypto: aspeed - Add HACE hash driver")
> >
> > I will be happy to test any patch or provide any extra log if needed.
> >
> >
> > --
> > Regards
> > Sudip
>
> Hi Sudip,
>
> I already sent another patch to fix this build error, could you give it a try?
> https://lkml.org/lkml/2022/8/29/131

Thanks, that has fixed the failure.


-- 
Regards
Sudip
