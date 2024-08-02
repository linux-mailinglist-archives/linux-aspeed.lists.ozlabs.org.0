Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 031969463E4
	for <lists+linux-aspeed@lfdr.de>; Fri,  2 Aug 2024 21:25:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=bkNilIFm;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=erPfkcNu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WbG5X0ZBCz3dKH
	for <lists+linux-aspeed@lfdr.de>; Sat,  3 Aug 2024 05:25:52 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=bkNilIFm;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=erPfkcNu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.157; helo=fhigh6-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fhigh6-smtp.messagingengine.com (fhigh6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WbG5M2BkXz3dS0
	for <linux-aspeed@lists.ozlabs.org>; Sat,  3 Aug 2024 05:25:42 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 34912114836A;
	Fri,  2 Aug 2024 15:25:39 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute4.internal (MEProxy); Fri, 02 Aug 2024 15:25:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1722626739;
	 x=1722713139; bh=KPWpdBe/T1YEYhELoEmhOZAJmkQnlBGJanxmk1YGIuE=; b=
	bkNilIFm7jHFTG21pN96yxq5at/ynSJ0aE9B30By9sJdeORKNRVPtesIItlO2F4i
	xTx/vAFmh6B/b3hlf/o6VoDjyBgstfm2F3yKGAd4rjO4ZyoE5J8aQNkd/pFynocd
	qv/EsJSWYHJ1Otug4POEnkMh9VR58EBN0FwPPMdMnNz91/9dcoa+CMRUF6MxwGBw
	jfCfGN6zCNdlOoyEOEv016SDQXukBNflql9arXxmceGiquvp+bW1ygSVEJG4Nnkv
	cc+jBiQfKsVgcKycEmx8IK73OAlDFpnUv5tLhpRIbA5WVb80Qkhnbg0aYHwNA4zP
	TPArDCWhwFCRE9h89hNKxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1722626739; x=
	1722713139; bh=KPWpdBe/T1YEYhELoEmhOZAJmkQnlBGJanxmk1YGIuE=; b=e
	rPfkcNuYhJzr3v3d7rMg/Mv+IbTYL/sTUGzhEDvuFKY8HHAsJu8wPsf55YiJx1kb
	4JF4IlHI+FXcUbANvlW0R6rkdkjJs6nQV2Uj3CepmXhwR0OJvnPmthtZGkpo8S4Z
	1F533P8AdsLfmH7LtQI7Zy+UE5X0L1iNkOOlGo/TW0oF8SaGVia80pFnj3LszEgY
	8jLMck8NSt1/JHNcd2QAguinfBQjbvs4lbouWc/24GS9CgJBaqgbr7CtNhbAoBTb
	BWGW+GbAmjnQs7EIPFPaReDjK9MckNS+A+nRj6A2LZYlkbJt16isEIXFP06RtT5/
	n3KrR1JQY3SS7w6SR2dsw==
X-ME-Sender: <xms:sTKtZo3SSLK8f72pTQY-sidmaGKK3FiUCEYwKKE5SUZE9dJ5YP-T2g>
    <xme:sTKtZjFwHv69WnaZrjOyQeKAYh8caaO0jwTDx2t9w7oTcMWpFMvzBKjTkdypfV4DJ
    Dv6wecqYWoJMEh_ajw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrkedtgddufeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefh
    vdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtoheptd
X-ME-Proxy: <xmx:sTKtZg4jTm6aly8v38zdsT-ADFCvP0qejZ8GBDB4X6MpsETbpO0q-Q>
    <xmx:sTKtZh3tjuTW0qc6kYHkTkzq6O09yRNIr9jF65j7Ilu-syJ8E0kKEA>
    <xmx:sTKtZrHH4rKMaGOUEZKuqAz8K8_l_QwfyE3I9mIKqaket8zOBwTMgA>
    <xmx:sTKtZq-oCgBamFK89lfAGjbzCyyI4l2DsQqwWYIt2SEbZjWtP5r2lg>
    <xmx:szKtZubXLPbTQCZj5b9WMK9XF-F89rDLppcDT3xiSTJdgLIwRKEtUPYx>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 48551B6008D; Fri,  2 Aug 2024 15:25:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 02 Aug 2024 21:25:17 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>,
 "Kevin Chen" <kevin_chen@aspeedtech.com>
Message-Id: <9795437d-b409-4105-9583-4dcb24b5a06c@app.fastmail.com>
In-Reply-To:  <CAA8EJprcmQvE3PjySxBKq7Qv3JHJHhic2aQ5MDnwZaf-D=K2Rw@mail.gmail.com>
References: <20240802090544.2741206-1-kevin_chen@aspeedtech.com>
 <20240802090544.2741206-9-kevin_chen@aspeedtech.com>
 <CAA8EJprcmQvE3PjySxBKq7Qv3JHJHhic2aQ5MDnwZaf-D=K2Rw@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] arm64: defconfig: Add ASPEED AST2700 family support
Content-Type: text/plain
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Catalin Marinas <catalin.marinas@arm.com>, Michael Turquette <mturquette@baylibre.com>, Will Deacon <will@kernel.org>, linux-clk@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, Rob Herring <robh@kernel.org>, Bjorn Andersson <quic_bjorande@quicinc.com>, linux-aspeed@lists.ozlabs.org, Udit Kumar <u-kumar1@ti.com>, Lee Jones <lee@kernel.org>, Andrew Jeffery <andrew@codeconstruct.com.au>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, Olof Johansson <olof@lixom.net>, krzk+dt@kernel.org, Shawn Guo <shawnguo@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Aug 2, 2024, at 21:20, Dmitry Baryshkov wrote:
> On Fri, 2 Aug 2024 at 12:05, Kevin Chen <kevin_chen@aspeedtech.com> wrote:
>>
>> Enable CONFIG_ARCH_ASPEED in arm64 defconfig.
>
> Why? Usually the defconfig changes have "Enable CONFIG_FOO as it is
> used on the Bar Baz platform" commit message.

I would also expect to see aspeed specific device drivers
to get enabled in the same commit. On arm32, I see

CONFIG_ASPEED_KCS_IPMI_BMC=m
CONFIG_ASPEED_BT_IPMI_BMC=m
CONFIG_I2C_ASPEED=m
CONFIG_SPI_ASPEED_SMC=m
CONFIG_GPIO_ASPEED_SGPIO=y
CONFIG_SENSORS_ASPEED=m
CONFIG_VIDEO_ASPEED=m
CONFIG_DRM_ASPEED_GFX=m
CONFIG_USB_ASPEED_VHUB=m
CONFIG_RTC_DRV_ASPEED=m
CONFIG_ASPEED_LPC_CTRL=m
CONFIG_ASPEED_LPC_SNOOP=m
CONFIG_ASPEED_P2A_CTRL=m
CONFIG_ASPEED_ADC=m
CONFIG_FSI_MASTER_ASPEED=m

Presumably not all but a lot of these are also used on AST2700.

     Arnd
