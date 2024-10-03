Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A2198EB4D
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Oct 2024 10:17:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dxNA0pgO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XK4KM5c51z2yZS
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Oct 2024 18:17:11 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727943429;
	cv=none; b=mC5VAHXkWka29r4eVGopXlSGxrRM7FnVoLIFESRkQ/C/cFB3wk6beKoTYb2A13kVwL5riK/CvU3Oeqm5paimtLnZ3ij4GLgyBm89hxJHwNvjqGov56EYwiefd7/USUpBYCBo6F6iDgn92SZ85lp5yabTKcz+MJsrzt5pDPaBXcQPuWKplhZpX7FMcp7H9DregCn5wmjME9ocS11N6LA3JUeElPF5Wb4SmbdIvwBzHQXL7QMlMY/lZf1ABV114EnRGD6AOg4a1xg8gmoWiwu8gC7b0PC6J0rUevJik/8BtXPwVQWdULjrCO5vaCspc1uFS0Md6TvYLYgU3C6GRcfNGw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727943429; c=relaxed/relaxed;
	bh=5T/J9y/ePBQvv+Tk/VMq9MmZO5pzMEDU1cDHiid/QA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ezXjt8+twe2lkPWET4Ka8sfXoA+ffx1Dtmq49CrdYH6jSP4t7BcRBw+fZzQqvRXvaebk055C/3bfPTQMhrD+sGR4kuvZZ41WQzfpEmuOjd27Y4q8Fn9zpNa5VGLUfzbJpMBhMIhOEiYYHFk/STGkMpusW7UMC4oW3yuIPbRtNjyfWLCqirswKmw2Cui0zfmVl2g2xVzsyvqHAeu/eGU6zbPiFEzoFvRxsKgFikYuXrvkF+uwG7tBEczrUJMI2ZTZhcwV6tdcw4jfgJ+/lLqETPJ+KsCOCkChT7yIpGBCMUiUqTNagZIph4gIVLOfBBm4BC4J1avg/QWpDcthlRjlzw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dxNA0pgO; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dxNA0pgO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XK4KJ6bncz2yT0
	for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Oct 2024 18:17:08 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 87D1CA4342A;
	Thu,  3 Oct 2024 08:16:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9366C4CEC7;
	Thu,  3 Oct 2024 08:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727943426;
	bh=OuqlnscLjuWAlMQHupr3CnALdnTmuNagISzh0YOHOpY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dxNA0pgOKjYSQN+blz559cd2HYR9DmGaugCOmGrgtvVKc+Dyxt8WKCVhj51Sk4ioL
	 LL/PJw0hjNXmEgIep1eUn1kcmQBx0s4qnOFYTr2uDJhfm37Pn8Vo8mqLmy70SI1ZZC
	 uLtkWgNf8B2CWfWK1+TnOK4/LEDO3hhEz5MF24yrsRBsF9whXvYuKHCIj7hiLIUrl2
	 wOt7WG+adZkaT+aIvrYm9RQNnDhjhV0VNEAq/MPh+cvjCuuLsRe3WAn01medH8TBID
	 5ANcMVqgy1MtYMaNueUCNb1BX+HlaIT1ib4VHUFpJx4W/UUi7HWuCfTsozIK8A4JR/
	 OQhnuFyx+FSzg==
Date: Thu, 3 Oct 2024 10:17:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Naresh Solanki <naresh.solanki@9elements.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: aspeed: add IBM SBP1 board
Message-ID: <xuczpa6nrxjwo7hjn62ehblnzc5twupghbg4uuwp5vfczw3gmg@x23yhbxjccpy>
References: <20241002084023.467383-1-naresh.solanki@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241002084023.467383-1-naresh.solanki@9elements.com>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Oct 02, 2024 at 02:10:17PM +0530, Naresh Solanki wrote:
> Document the new compatibles used on IBM SBP1.
> 
> Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
> ---
>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> index 95113df178cc..8c04d6eaec08 100644
> --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> @@ -89,6 +89,7 @@ properties:
>                - ibm,everest-bmc
>                - ibm,rainier-bmc
>                - ibm,system1-bmc
> +              - ibm,sbp1-bmc

Keep alphabetical order.

Best regards,
Krzysztof

