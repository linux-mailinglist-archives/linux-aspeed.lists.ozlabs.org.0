Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F45456E07
	for <lists+linux-aspeed@lfdr.de>; Fri, 19 Nov 2021 12:11:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HwYr612wDz307j
	for <lists+linux-aspeed@lfdr.de>; Fri, 19 Nov 2021 22:11:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=cerno.tech header.i=@cerno.tech header.a=rsa-sha256 header.s=fm1 header.b=SHgShHBf;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=dK1MlZtP;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cerno.tech (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=maxime@cerno.tech;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=cerno.tech header.i=@cerno.tech header.a=rsa-sha256
 header.s=fm1 header.b=SHgShHBf; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=dK1MlZtP; 
 dkim-atps=neutral
X-Greylist: delayed 582 seconds by postgrey-1.36 at boromir;
 Fri, 19 Nov 2021 22:10:53 AEDT
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HwYqx0ggHz2yYl
 for <linux-aspeed@lists.ozlabs.org>; Fri, 19 Nov 2021 22:10:53 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 508085C0152;
 Fri, 19 Nov 2021 06:01:04 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 19 Nov 2021 06:01:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm1; bh=
 wMbZ7KJ8PdGz2rR2LNAQ/bdGFOMlOCIwBFKQo5W87oo=; b=SHgShHBfQqfPyfFY
 JMuudBwdBj4zAjNCch2ICy/5x/oNoTTfNKFOfOQbRxoX29gz8Rka1MltAI+Gzc55
 5PnWndVro5d1ELWUunMukP4597pTz4g5bDUcBO3gtPY6E14sR/iF8iGyjd8mb2Fv
 sjqu8AjhvLii61F532Qbp+u5WmXvbMFGPGTrPQ9WJYYf2qcFiSvpkDJoUN8mPBI2
 8/KpF74VaavXtmAN5BBXkKhZgX8Ba6xcl6mfoPHdpyMFDrW/JlWAVRCnS9UCKmHI
 WEBTFKNjZaMCDh+sLr1OcI553cbgSnewnhw7lEGxAtm71WfZp5+35dX3DOEduR9H
 iPJiIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=wMbZ7KJ8PdGz2rR2LNAQ/bdGFOMlOCIwBFKQo5W87
 oo=; b=dK1MlZtP894wuVX9B/JZkfQwr/ZZfo8MmuYuCYcGdAdvDAua415VX+OGO
 8as6uO+yCnuB4TdOi1gSnueAczGYAfeU3n32KZ0KTtc6GLHXoy30B0VI5g3L5wgk
 Wd0vQTiXkA3zjJttZSrNIIjF1LKNZOa3AtMBY7jKo9OGcNxz6dpg8gZszCO/tBym
 todDhYZvciVJgLQaq+QTik+bzFCp993M4ip2KrvXCffTEKlpK2nPmo+o4xzOQfE4
 jfJbJr74IkaQL0edQxD/EWvgcZWDqWxD7c0vmNaipizJczytHK+C35Jj0/7ZF04U
 zJ4bdQErHDCmFIJStF7aULKPoVzlQ==
X-ME-Sender: <xms:7oOXYdGhKKf1IsAEWGpPK7F3dnTDmlZfyarrfTaltFUzlme5N6XqPg>
 <xme:7oOXYSXIUGDO0NNdbwYX1IHlnwW4FMdQz_JmbV9ANxSKmpxoytqIOXuIrTcPxgXVN
 DMPW2SwA3iQ-brg6e4>
X-ME-Received: <xmr:7oOXYfLNsiUr8fm5-zfDTMFEG4gno_0M7ey8LhgU2nfxO45Y3dxb5L_-yW6TBnZfO5dUnH83yeg_qJQj8fsYfl_dgNimczNxvkgX1wDF1UY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeekgddvudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfefgeei
 keeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:7oOXYTGIJK4BcqKyZSCGsP0crtLVMYXj3OzT_dD5g6Iun_Q7K4Glfg>
 <xmx:7oOXYTXHWT9QXhKFJ9dPc-Iz61f-RAF1iyNEcO47Ly_W1Jbf-Yq_rg>
 <xmx:7oOXYeML9r2cjHjVbuJnNJ5cCfeweUpq2cxQkIk0_WUcdVcAOT6JZg>
 <xmx:8IOXYaGlQJmrTVoiAmZEyrD-DcgbOr3MvgwyCF5_A0wd8ltFCaiRmQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 19 Nov 2021 06:01:02 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Jeremy Kerr <jk@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Oskar Senft <osk@google.com>
Subject: Re: (subset) [PATCH] drm/aspeed: Fix vga_pw sysfs output
Date: Fri, 19 Nov 2021 12:00:57 +0100
Message-Id: <163731964127.830809.15279573029825789668.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211117010145.297253-1-joel@jms.id.au>
References: <20211117010145.297253-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: linux-aspeed@lists.ozlabs.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Ali El-Haj-Mahmoud <aaelhaj@google.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 17 Nov 2021 09:01:45 +0800, Joel Stanley wrote:
> Before the drm driver had support for this file there was a driver that
> exposed the contents of the vga password register to userspace. It would
> present the entire register instead of interpreting it.
> 
> The drm implementation chose to mask of the lower bit, without explaining
> why. This breaks the existing userspace, which is looking for 0xa8 in
> the lower byte.
> 
> [...]

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime
