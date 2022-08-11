Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 984FC5928DF
	for <lists+linux-aspeed@lfdr.de>; Mon, 15 Aug 2022 06:39:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M5hPx6lHjz3blS
	for <lists+linux-aspeed@lfdr.de>; Mon, 15 Aug 2022 14:39:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JDLwtv92;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=lee@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JDLwtv92;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M3HmV1QdPz2xHJ;
	Thu, 11 Aug 2022 17:02:02 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 44AB3B81F78;
	Thu, 11 Aug 2022 07:01:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B76B9C433D6;
	Thu, 11 Aug 2022 07:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660201316;
	bh=0LegDg7v4fhM4AuETmhue5pPKRXRoWa9Os6m6U3leVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JDLwtv923XLawqePcp/VWanKefYB8r8l7P57dxcFStR9MG78QOnnv0TvfCCCbG0a9
	 98RPu2VUgzM4t75DZo+YBXAPqmuiQhz5j2PCDMnOW4w+PPZt39ATf7wo+adGM/VLC7
	 Juqsrokr+L2iSObcRhYYBNDRrBvAZVh878F5U1S+6X0oUObP6j757Nq8aa+7rcjdUv
	 I293YWSd+yC5/TCnXsacUaHHFtEAdi9UsH5lmKIxIJkKtHNpS7W36e8vYBGo3ORfRE
	 467WVSyBtYfj9JwCzgrOD7A/0gaIZ/GnK+Ri7lKjflWO+SofeqxJ9Xe4qAyaQ+Jmpz
	 VwKrclwl8BmqA==
Date: Thu, 11 Aug 2022 08:01:49 +0100
From: Lee Jones <lee@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: mfd: aspeed,ast2x00-scu: Convert to DT
 schema format
Message-ID: <YvSpXfA8o+3FfiPb@google.com>
References: <20220810161635.73936-1-robh@kernel.org>
 <20220810161635.73936-3-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220810161635.73936-3-robh@kernel.org>
X-Mailman-Approved-At: Mon, 15 Aug 2022 14:39:08 +1000
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 10 Aug 2022, Rob Herring wrote:

> Convert the aspeed,ast2[456]00-scu binding to DT schema format.
> 
> The original binding was missing '#address-cells', '#size-cells',
> 'ranges', and child nodes, so add them.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/mfd/aspeed,ast2x00-scu.yaml      | 110 ++++++++++++++++++
>  .../devicetree/bindings/mfd/aspeed-scu.txt    |  48 --------
>  2 files changed, 110 insertions(+), 48 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mfd/aspeed-scu.txt

Applied, thanks.

-- 
Lee Jones [李琼斯]
