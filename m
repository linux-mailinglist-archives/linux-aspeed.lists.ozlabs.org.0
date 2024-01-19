Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 282AF832FF4
	for <lists+linux-aspeed@lfdr.de>; Fri, 19 Jan 2024 21:44:09 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EcLBk6Rg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TGs6G6pBMz3bsX
	for <lists+linux-aspeed@lfdr.de>; Sat, 20 Jan 2024 07:44:06 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EcLBk6Rg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TGs674nqLz3cGS
	for <linux-aspeed@lists.ozlabs.org>; Sat, 20 Jan 2024 07:43:59 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C4D8D619FD;
	Fri, 19 Jan 2024 20:43:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31AC2C433C7;
	Fri, 19 Jan 2024 20:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705697034;
	bh=LxukKcj7E7XnJoK97Icxh0TVEc5zfCjPZPAdllnyToM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EcLBk6RgAVlSKSdqY7g8AzLqVIwpaYRkOyCMSIhgyDXQtQez/CqYTzk2i1h3gKG6+
	 kYKuQPFl3UN7kmYRMWH+XXqR9WIkHw+3fpkuHL8BdkcONj29NUVG8UbMCF+VWI/Scx
	 FPNcMxaYbl46Etqae2A7KCfomMVhak+nPthFjf6OHU+9gr4yK/11rK1qGo9aIuTHh2
	 o9SlSObEcBpAquFiVvCVGzre3DdrxiAMAc/U6FrNks5NmDxQAXYZ9Be+R6sIOa/+Vg
	 O8zUJQ+QfF76xhh8oe1mUUqxMkgXVl7lfLLXV8hQdNIcyAA8ds/NPjjMzWyjrMxtGT
	 hkOdUtYLp2Cqw==
Date: Fri, 19 Jan 2024 14:43:52 -0600
From: Rob Herring <robh@kernel.org>
To: Ninad Palsule <ninad@linux.ibm.com>
Subject: Re: [PATCH v4 2/3] dt-bindings: Add DPS310 as trivial device
Message-ID: <170569701502.1007352.2755613869226739924.robh@kernel.org>
References: <20240116183734.3944028-1-ninad@linux.ibm.com>
 <20240116183734.3944028-3-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240116183734.3944028-3-ninad@linux.ibm.com>
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
Cc: festevam@denx.de, geert+renesas@glider.be, andre.werner@systec-electronic.com, naresh.solanki@9elements.com, johannes.holland@infineon.com, linux-hardening@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, peterhuewe@gmx.de, patrick.rudolph@9elements.com, linux-aspeed@lists.ozlabs.org, peteryin.openbmc@gmail.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, jgg@ziepe.ca, andrew@codeconstruct.com.au, luca.ceresoli@bootlin.com, linux@roeck-us.net, devicetree@vger.kernel.org, conor+dt@kernel.org, keescook@chromium.org, alexander.stein@ew.tq-group.com, robh+dt@kernel.org, lakshmiy@us.ibm.com, bhelgaas@google.com, geissonator@yahoo.com, linux-arm-kernel@lists.infradead.org, tony.luck@intel.com, linux-kernel@vger.kernel.org, gpiccoli@igalia.com, jarkko@kernel.org, broonie@kernel.org, vincent@vtremblay.dev, linux-integrity@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On Tue, 16 Jan 2024 12:37:33 -0600, Ninad Palsule wrote:
> Infineon DPS310 is a barometric pressure and temperature sensor.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks!

