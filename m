Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 261AF146095
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 Jan 2020 02:54:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4835111h7RzDqVL
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 Jan 2020 12:54:13 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.229;
 helo=new3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=qsshw+6M; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=DN6OGW/S; 
 dkim-atps=neutral
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48350h0HYNzDqMh
 for <linux-aspeed@lists.ozlabs.org>; Thu, 23 Jan 2020 12:53:55 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id D8A6A6D87;
 Wed, 22 Jan 2020 20:53:51 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 22 Jan 2020 20:53:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=ujZkvtF9majEmku/Gxs4rZoUakuhfzp
 hD8ol/URHilo=; b=qsshw+6MxBNBzlpsVfUQJvzPlg1mYf034IOSuoePEBVtHNN
 ehE++KC/RbpuXEATKpEmSmmnCDp1WFqj7zSqqmQaLd1P/XsqZQpuulLziDntGcEi
 Zl24Kqe7K5broi96LBy5wFhNHIwNwXyEvvLMp9EqS/6nsF/A1gBvZHTJSR+ZCTq8
 jWvOnveizc8TEi4FFYrl6/b6ptzaBi4KjnepiyPNrzEAfiFHFKqfnudBBcXcd+Vl
 1Q6FBERhKPJL2nFTyOkGQPs5b8QvcnoAzkZn2Br4y2nAbo2Du0g3lZgqPa6+xHCl
 fQ1vp8LM4m3v8l5So9ZZ5kwWz2cHB6+LstSxB/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ujZkvt
 F9majEmku/Gxs4rZoUakuhfzphD8ol/URHilo=; b=DN6OGW/SMqdXSI8jjtOzO2
 pGGVbrE9JRzGYsU3PcIOiobOZj1lO91DbwO31coNzfzM79yWYDsfaH1z/FrE4pOw
 K1cSpis2xl8x04ImWo4vZfPpa6T2R2jbu6OXfyod2Hi9b39uZVhOzKR8R0hG5A/N
 pUc9U3pDRSgmijNImgE+OK81Ohewqo/E9GWP5dUvTYMhLzWSWl9uJyv9P6EMFbBA
 g9nO1fp1IBXJUNrvbSrHxWw/xir2jOWs+Mub7vIioYbyUbYPRtBaAkBrcb7BhOTB
 fSY/RMQ+yIIyPB8wd9BHAvboR+hwUPsKTXljq72DPmDKDp0NAzJYOwmNdvlrtwAA
 ==
X-ME-Sender: <xms:rvwoXnPmSRFRoFSuOm7H2Q4DecD6HAwCBDdiFFGSAvJj6zxaqmvceQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrvddugdefiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghj
 rdhiugdrrghu
X-ME-Proxy: <xmx:rvwoXvx-psYu7LL5r4lFE6gYjRtdJY7jDu8sCdwsxIUqEXwemxeeCg>
 <xmx:rvwoXguvi3BjUj3AREX18fnbuZnb3eAzM5mUb7BWgebWP_w_zFRS2A>
 <xmx:rvwoXo63d6GAWwmGVoM4TP7Mnn-5xB2vKVnbwUhGjRvT8NIoJVAvjw>
 <xmx:r_woXnavh1Sem4tw8dB6XhIxw3Uv0cmbKNPj4_UAE9VF6956A8QC-w>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 7543AE00A2; Wed, 22 Jan 2020 20:53:50 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-754-g09d1619-fmstable-20200113v1
Mime-Version: 1.0
Message-Id: <575811fd-24ca-409c-8d33-c2152ee401d7@www.fastmail.com>
In-Reply-To: <4446ffb694c7742ca9492c7360856789@neuralgames.com>
References: <20200120150113.2565-1-linux@neuralgames.com>
 <CACPK8XfuVN3Q=npEoOP-amQS0-wemxcx6LKaHHZEsBAHzq1wzA@mail.gmail.com>
 <4446ffb694c7742ca9492c7360856789@neuralgames.com>
Date: Thu, 23 Jan 2020 12:23:29 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Oscar A Perez" <linux@neuralgames.com>, "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH 1/2] hwrng: Add support for ASPEED RNG
Content-Type: text/plain
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Matt Mackall <mpm@selenic.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


> Thanks for reviewing the patch.
> 
> The RNG on Aspeed hardware allows eight different modes for combining 
> its four internal Ring Oscillators that together generate a stream of 
> random bits. However, the timeriomem-rng driver does not allow for mode 
> selection so, the Aspeed RNG with this generic driver runs always on 
> mode 'seven' (The default value for mode according to the AspeedTech 
> datasheets).
> 
> I've performed some testings on this Aspeed RNG using the NIST 
> Statistical Test Suite (NIST 800-22r1a) and, the results I got show that 
> the default mode 'seven' isn't producing the best entropy and linear 
> rank when compared against the other modes available on these SOCs.  On 
> the other hand, the driver that I'm proposing here allows for mode 
> selection which would help improve the random output for those looking 
> to get the best out of this Aspeed RNG.

Have you published the data and results of this study somewhere? This
really should be mentioned in the commit message as justification for
not using timeriomem-rng.

Andrew
