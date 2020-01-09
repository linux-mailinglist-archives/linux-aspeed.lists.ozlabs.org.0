Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F3925135266
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Jan 2020 06:06:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tYxq5YCXzDqXK
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Jan 2020 16:06:55 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=L3c4NMVN; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=fEwkixlk; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47tYxh025dzDqWb
 for <linux-aspeed@lists.ozlabs.org>; Thu,  9 Jan 2020 16:06:47 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6018121BF9;
 Thu,  9 Jan 2020 00:06:45 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 09 Jan 2020 00:06:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=MF8c+sdns7iguGosmLN+yWRChH5HbQH
 EVoRuFYd3R88=; b=L3c4NMVNgbWCOOtr/APLZBN3ezi4IzeQfH9jOLv3qEDdjgH
 i2jznUAAc++h/cpuHDptk5D3bM+mnfokTiurIEyFhz0TCzoO0KnoT2D+6RJ9cVK/
 k8J5Bg1gz3AclF5liUl/z+6+JfauXv15tExiC0ZYdRYhesyheHzwmOUnMEELAsqO
 bWFComFbdj0vpzJyZ4abMWM0P19Rb+s00cp0j7wzB06FqJ5ZD1pOWPSIENLi3YgF
 6dsChMBe7vWqyetWyJgV5ZxarS+5vgSgsVSW02PpCBN/iotRWSmaiLl8LmtQn7DD
 4EHxLK5H08DJHufYDYrCb3mTBfrXTr4YR+RzD7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=MF8c+s
 dns7iguGosmLN+yWRChH5HbQHEVoRuFYd3R88=; b=fEwkixlkFKOerFt8LoBhLn
 aW2pyVTNpNZ6a9E7Y0NVAkFjwG11d9dkCGNDNlG+nVEdXR9Nb3xHLmg1egEI8i0U
 b1IKI01QCnXta+ZgubHVhYRRkP3WegkrdkNjXDCpI4DEuVxfEGzXTXZVah6VSAPd
 yrTXvb5up17dDtHYWtrTXbTMGeVkC1VVtLNwoLcz8ZxckT2zw66g/Pm3vX0QKUqt
 osN4oG363+e2lKlzknwqP09GpCox7cpT4xbvmSeCgJ14GJP5JVzq+MMv/x83pg5h
 5xdplFNqyNrOqVruJGKfX+vfFEZQF3k2Nh3S6IcV9Le5G8y4jzkQbNRtBYK+6Jsg
 ==
X-ME-Sender: <xms:5LQWXtDslOqEN2MlmzehoK1lmubcYDSSkWT1Kc5No_MvnVsqbX3W5g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdehledgjeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:5LQWXuy8aZIvXShIeiG8FrIyBgCS2ys0DC8mdDP9HTQJ8SvxVmuHdA>
 <xmx:5LQWXiD8GxHWtmp_m5OtR7PzD33WH7vibT2nyX9Q1jEjRioz_DgDRA>
 <xmx:5LQWXjaVUAXR9tvXXlEj1gyc5B8x8r9yUlIIYPBFcImJ65cU7uZ_jA>
 <xmx:5bQWXrdi0ZYe-MuR_Kc2R9t9O1rb1IDJ9CMC2yN25KGFXlGLa3iu1w>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E6FC6E00A5; Thu,  9 Jan 2020 00:06:43 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-740-g7d9d84e-fmstable-20200109v1
Mime-Version: 1.0
Message-Id: <3c44c745-d39a-4724-860d-a66537b2adbb@www.fastmail.com>
In-Reply-To: <1577993276-2184-7-git-send-email-eajames@linux.ibm.com>
References: <1577993276-2184-1-git-send-email-eajames@linux.ibm.com>
 <1577993276-2184-7-git-send-email-eajames@linux.ibm.com>
Date: Thu, 09 Jan 2020 15:38:20 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>, linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH v4 06/12] soc: aspeed: Add XDMA Engine Driver
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 tglx@linutronix.de
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Fri, 3 Jan 2020, at 05:57, Eddie James wrote:
> +static int aspeed_xdma_init_scu(struct aspeed_xdma *ctx, struct device *dev)
> +{
> +	struct regmap *scu = syscon_regmap_lookup_by_phandle(dev->of_node,
> +							     "aspeed,scu");
> +
> +	if (!IS_ERR(scu)) {
> +		u32 selection;
> +		bool pcie_device_bmc = true;
> +		const u32 bmc = SCU_PCIE_CONF_BMC_EN |
> +			SCU_PCIE_CONF_BMC_EN_MSI | SCU_PCIE_CONF_BMC_EN_IRQ |
> +			SCU_PCIE_CONF_BMC_EN_DMA;
> +		const u32 vga = SCU_PCIE_CONF_VGA_EN |
> +			SCU_PCIE_CONF_VGA_EN_MSI | SCU_PCIE_CONF_VGA_EN_IRQ |
> +			SCU_PCIE_CONF_VGA_EN_DMA;
> +		const char *pcie = NULL;
> +
> +		if (!of_property_read_string(dev->of_node, "pcie-device",
> +					     &pcie)) {
> +			if (!strcmp(pcie, "vga")) {
> +				pcie_device_bmc = false;
> +			} else if (strcmp(pcie, "bmc")) {
> +				dev_err(dev,
> +					"Invalid pcie-device property %s.\n",
> +					pcie);
> +				return -EINVAL;
> +			}
> +		}
> +
> +		if (pcie_device_bmc) {
> +			selection = bmc;
> +			regmap_write(scu, ctx->chip->scu_bmc_class,
> +				     SCU_BMC_CLASS_REV_XDMA);
> +		} else {
> +			selection = vga;
> +		}
> +
> +		regmap_update_bits(scu, ctx->chip->scu_pcie_conf, bmc | vga,
> +				   selection);
> +	} else {
> +		dev_warn(dev, "Unable to configure PCIe; continuing.\n");
> +	}

Not something you need to fix but generally I'd structure this as a early-return:

    if (IS_ERR(scu)) {
        dev_warn(dev, "Unable to configure PCIe; continuing.\n");
        return 0;
    }
    ...

Could probably also improve the warning message to say what caused the
failure, but again, something that can be changed later.
