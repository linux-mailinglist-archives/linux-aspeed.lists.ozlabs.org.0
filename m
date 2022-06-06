Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 771DC53E196
	for <lists+linux-aspeed@lfdr.de>; Mon,  6 Jun 2022 10:23:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LGmhP0dzVz3bkq
	for <lists+linux-aspeed@lfdr.de>; Mon,  6 Jun 2022 18:23:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gM8wZ/Jx;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com; envelope-from=clabbe.montjoie@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gM8wZ/Jx;
	dkim-atps=neutral
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LGmhF3ZWtz306r
	for <linux-aspeed@lists.ozlabs.org>; Mon,  6 Jun 2022 18:22:51 +1000 (AEST)
Received: by mail-wr1-x435.google.com with SMTP id q26so8431892wra.1
        for <linux-aspeed@lists.ozlabs.org>; Mon, 06 Jun 2022 01:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=oKiwtYWwJ/ZAYTG8vdYuhRqG3yc8krk/ZBTNC2MOyng=;
        b=gM8wZ/Jx8lrC6fmxR/XpEfarEEJJz9uExyTwyh9muHTRApq5hOGMFrj88oPbNqF3iC
         60paYjYKRrLSiyckRcOsuxrsTRE/wNkcWlUsZMqRH3zEvh9i0dxMTSGLoDRTKavBADLH
         ZXw6OCXI8UmfWx78iS5dFmwHY5CKXWlAT3c4H3aEwasPFnsnspzUqibg/fiKHAbG3HaL
         /3o2rDM+OjpPOvSYFeU2irp+ETdvmomGGpJHXjbqTU+Fmcr+kM3jemaA8xMuVHho49lw
         Vupf/aoNKgVD1uzHD+OZXJ7X9kCdzafFKp9oK4Dh1iBSgvpimNCfkYHvt5roDcq6Fqqq
         6vQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=oKiwtYWwJ/ZAYTG8vdYuhRqG3yc8krk/ZBTNC2MOyng=;
        b=Ti5pde6tFpF+jtnwocbaaJZa3YbNd1Qj0FskB+oggXq8UOOAVpMqjADhbgP0q69Ll8
         XiFxkkZ+QwKr4zhQzRxZY8e7HmVlcHao1VyUPaCF7nCLPfD/lIV3p+sY8ovORkU/grD2
         l3rvPjcGwFKJzNbewseiUqp6q5GFpxN29O6p15cOuPj1pYZKBzfIfEoBWxK4o8oPhKBJ
         /2szGaBDeIQcaGDIYtDaGoAerRn3OxvDEXNFIUGDWIoGosgDIxx9eRpD5MZOI1o5UcoG
         SXSNW5SSPOCzJm84+GBPGB+31i7m1neSIx/6lrUFHRYLlnY13fitSAX65rTIhMoNUdsI
         YfWA==
X-Gm-Message-State: AOAM531e+I1S0Ibp8+Ms1L3b7ZZfym0lDXPH9RgiJxwTj+tK9LZgvsdY
	/aQkF9w1faMmDDjjyyyN9TA=
X-Google-Smtp-Source: ABdhPJz7JciclJBrOqf8JtfMLxlNu71DjfTpAykx1io2ek9vepBw+TG/Dtn+BMR5meU5xE3utuCgKg==
X-Received: by 2002:adf:eb11:0:b0:213:19dd:e1aa with SMTP id s17-20020adfeb11000000b0021319dde1aamr19393403wrn.324.1654503767336;
        Mon, 06 Jun 2022 01:22:47 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id j22-20020a5d4536000000b0021108003596sm14062329wra.10.2022.06.06.01.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 01:22:46 -0700 (PDT)
Date: Mon, 6 Jun 2022 10:22:41 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Neal Liu <neal_liu@aspeedtech.com>
Subject: Re: [PATCH 1/5] crypto: aspeed: Add HACE hash driver
Message-ID: <Yp25UVBCNHzeiQOn@Red>
References: <20220601054204.1522976-1-neal_liu@aspeedtech.com>
 <20220601054204.1522976-2-neal_liu@aspeedtech.com>
 <YpcYLiJfC6tgP2Nj@Red>
 <HK0PR06MB320263939B2E388481DE2A0A80DF9@HK0PR06MB3202.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <HK0PR06MB320263939B2E388481DE2A0A80DF9@HK0PR06MB3202.apcprd06.prod.outlook.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Johnny Huang <johnny_huang@aspeedtech.com>, Herbert Xu <herbert@gondor.apana.org.au>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "David S . Miller" <davem@davemloft.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Le Wed, Jun 01, 2022 at 08:38:51AM +0000, Neal Liu a écrit :
> > Le Wed, Jun 01, 2022 at 01:42:00PM +0800, Neal Liu a écrit :
> > > Hash and Crypto Engine (HACE) is designed to accelerate the throughput
> > > of hash data digest, encryption, and decryption.
> > >
> > > Basically, HACE can be divided into two independently engines
> > > - Hash Engine and Crypto Engine. This patch aims to add HACE hash
> > > engine driver for hash accelerator.
> > >
> > > Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>
> > > Signed-off-by: Johnny Huang <johnny_huang@aspeedtech.com>
> > 
> > Hello
> > 
> > Did you test with CONFIG_CRYPTO_MANAGER_EXTRA_TESTS=y (you should
> > said it in cover letter).
> > There are several easy style fixes to do (please run checkpatch --strict) Did you
> > test your driver with both little and big endian mode ?
> > 
> 
> Yes, I also test it with CONFIG_CRYPTO_MANAGER_EXTRA_TESTS=y. I'll describe it in cover letter as you suggested.
> And the style problem would be fixed, thanks for your suggestion.
> 
> How to test it with both little and big endian mode? It would be appreciated if you give me some clue.
> 

Hello

Sorry for the delayed answer.

You should try compiling and booting with CONFIG_CPU_BIG_ENDIAN=y

> > Also please see my comment below.
> > 
> > [...]
> > > +/* Initialization Vectors for SHA-family */ static const u32
> > > +sha1_iv[8] = {
> > > +	0x01234567UL, 0x89abcdefUL, 0xfedcba98UL, 0x76543210UL,
> > > +	0xf0e1d2c3UL, 0, 0, 0
> > > +};
> > > +
> > > +static const u32 sha224_iv[8] = {
> > > +	0xd89e05c1UL, 0x07d57c36UL, 0x17dd7030UL, 0x39590ef7UL,
> > > +	0x310bc0ffUL, 0x11155868UL, 0xa78ff964UL, 0xa44ffabeUL };
> > > +
> > > +static const u32 sha256_iv[8] = {
> > > +	0x67e6096aUL, 0x85ae67bbUL, 0x72f36e3cUL, 0x3af54fa5UL,
> > > +	0x7f520e51UL, 0x8c68059bUL, 0xabd9831fUL, 0x19cde05bUL };
> > > +
> > > +static const u32 sha384_iv[16] = {
> > > +	0x5d9dbbcbUL, 0xd89e05c1UL, 0x2a299a62UL, 0x07d57c36UL,
> > > +	0x5a015991UL, 0x17dd7030UL, 0xd8ec2f15UL, 0x39590ef7UL,
> > > +	0x67263367UL, 0x310bc0ffUL, 0x874ab48eUL, 0x11155868UL,
> > > +	0x0d2e0cdbUL, 0xa78ff964UL, 0x1d48b547UL, 0xa44ffabeUL };
> > > +
> > > +static const u32 sha512_iv[16] = {
> > > +	0x67e6096aUL, 0x08c9bcf3UL, 0x85ae67bbUL, 0x3ba7ca84UL,
> > > +	0x72f36e3cUL, 0x2bf894feUL, 0x3af54fa5UL, 0xf1361d5fUL,
> > > +	0x7f520e51UL, 0xd182e6adUL, 0x8c68059bUL, 0x1f6c3e2bUL,
> > > +	0xabd9831fUL, 0x6bbd41fbUL, 0x19cde05bUL, 0x79217e13UL };
> > > +
> > > +static const u32 sha512_224_iv[16] = {
> > > +	0xC8373D8CUL, 0xA24D5419UL, 0x6699E173UL, 0xD6D4DC89UL,
> > > +	0xAEB7FA1DUL, 0x829CFF32UL, 0x14D59D67UL, 0xCF9F2F58UL,
> > > +	0x692B6D0FUL, 0xA84DD47BUL, 0x736FE377UL, 0x4289C404UL,
> > > +	0xA8859D3FUL, 0xC8361D6AUL, 0xADE61211UL, 0xA192D691UL };
> > > +
> > > +static const u32 sha512_256_iv[16] = {
> > > +	0x94213122UL, 0x2CF72BFCUL, 0xA35F559FUL, 0xC2644CC8UL,
> > > +	0x6BB89323UL, 0x51B1536FUL, 0x19773896UL, 0xBDEA4059UL,
> > > +	0xE23E2896UL, 0xE3FF8EA8UL, 0x251E5EBEUL, 0x92398653UL,
> > > +	0xFC99012BUL, 0xAAB8852CUL, 0xDC2DB70EUL, 0xA22CC581UL };
> > 
> > Thoses IV already exists as define in linux headers (SHA1_H0 for example) But I
> > am puzzled on why you invert them.
> > 
> 
> This is Aspeed hardware limitation.

The limitation is that hardware does not know theses IV ?
Having them inverted seems to proof that you have some endianness issue.

> > 
> > Why didnt you use the crypto_engine API instead of rewriting it.
> 
> Any common crypto_engine API can be used? I did not find any, Maybe I miss something.
> It would be appreciated if you give me some clue.
> 

Please check crypto/crypto_engine.c.
You could take crypto/omap and allwinner/sun8i-ce as example of usage.

Regards
