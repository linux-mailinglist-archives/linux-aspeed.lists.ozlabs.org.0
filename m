Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C733488F2C
	for <lists+linux-aspeed@lfdr.de>; Mon, 10 Jan 2022 05:16:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXLB50LLsz2yN4
	for <lists+linux-aspeed@lfdr.de>; Mon, 10 Jan 2022 15:16:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=caWaHRxc;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=VfyA7k7w;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=caWaHRxc; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=VfyA7k7w; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXL9w50zDz2xWx
 for <linux-aspeed@lists.ozlabs.org>; Mon, 10 Jan 2022 15:16:36 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id C82213200AB0;
 Sun,  9 Jan 2022 23:16:32 -0500 (EST)
Received: from imap43 ([10.202.2.93])
 by compute4.internal (MEProxy); Sun, 09 Jan 2022 23:16:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=b5Cgl9itd7AC97FOAbhhfyGPsdddoh9
 msj4rVDJ3UHo=; b=caWaHRxcWAl8nYBXSDr4PW8NNvkJMRQuWcLu9hEZ9CNDs0s
 EEy37894xvZYvh9fA+hlDc6wWNsrv8i7jzvcJ1GARwKtW7ZTGVj1qFfUiDlaeg2J
 dLfkr40ZDFo1SO5CHv0ELmuVmyv+V/LSiJBjFpW5er0Yj/Y/cBe4xmDTHfq7piPu
 mKLmif8xbL9E0NElqE9dR09YgwjFMsSYXlmAn4LrpgtQxg29vevZe1W9VWAYhpy+
 8HT1ZEOQJrDvv8LmB8sGqki12Xe2Zzsb1S0m3fcuA8Tfu6t7Rgp3A3zujel0TBsn
 rqzXz4KdUSGg6LAXhGKVExPp/A6gM5gFv8O8kXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=b5Cgl9
 itd7AC97FOAbhhfyGPsdddoh9msj4rVDJ3UHo=; b=VfyA7k7wn5t32bNjm8/hTn
 UDrubE/UXPYisQHrq7RBTM6D8LirAaZmo0NCB07GiUVyvoEl6qatnl3fdYy6TtUF
 qoxUGFCTp0JzbwLgAULhiOHfi0Ph7zA57v+/SrX3K2URCyxFDS6mcBLp11CnFSKL
 mVGPdxHV9IBNMem5XllqBZ4OpUd/CRP/fdlhp7/m46z5/58bRJu3waiX08e+svvF
 dWUIe4MnwELANTlOs1IWXbikhsBzTSb5py2DH79U7AsPMqORFjlpSEQbC0Cn9/Vj
 JjhONOBef9h4KsufOfLWlx4/E08C5rCiO+mZu9M2GH7NeurUK6NP16EtKMexya8Q
 ==
X-ME-Sender: <xms:H7PbYV8PE7JWj-PJTssWIfIVAforjwSblCXy5UQjgBfuPRsex5S6EA>
 <xme:H7PbYZsBd8eONcE3QC_B19lgjqBhfpOqr9pOSmHkO2ZtxMdOOW3ImwbaSGIG22U9F
 GcO4fVdnK2c_V-Dew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudegledgjeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:ILPbYTBJYbVKjO4M-uAMkW_ksyGRQJX6Teb8UoRIGEaMAAPT7ftslg>
 <xmx:ILPbYZe1UP9l_uIGlnFkn_KdFNe1h0QraSXc6cX2rQCEZ5I-prfRjA>
 <xmx:ILPbYaO_-s1mkOOLnrCsDRWxjVn0okLgfFVbGFPEfnrGSkixjmNoTw>
 <xmx:ILPbYTb-svaH9IcZkee1NapW54GURHRwTrAnMsWXd9S1bT2KRbZX3A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id DA504AC0EA1; Sun,  9 Jan 2022 23:16:31 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4527-g032417b6d6-fm-20220109.002-g032417b6
Mime-Version: 1.0
Message-Id: <4a3d28d3-5912-4699-975f-480320486851@www.fastmail.com>
In-Reply-To: <20211231220138.119747-1-petr.vorel@gmail.com>
References: <20211231220138.119747-1-petr.vorel@gmail.com>
Date: Mon, 10 Jan 2022 14:46:10 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Petr Vorel" <petr.vorel@gmail.com>, linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH 1/1] arm: dts: aspeed: Fix typo
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Sat, 1 Jan 2022, at 08:31, Petr Vorel wrote:
> Fixes: 25337c735414 ("ARM: dts: aspeed: Add Inventec Lanyang BMC")
>
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Thanks Petr.
