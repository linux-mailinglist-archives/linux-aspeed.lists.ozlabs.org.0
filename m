Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3548B83C6
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 May 2024 02:40:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=HyrK8Lv0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VTdX12JvZz3cb8
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 May 2024 10:40:33 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=HyrK8Lv0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VTdWr4pl6z3cTg
	for <linux-aspeed@lists.ozlabs.org>; Wed,  1 May 2024 10:40:24 +1000 (AEST)
Received: from [192.168.68.112] (ppp14-2-127-66.adl-apt-pir-bras32.tpg.internode.on.net [14.2.127.66])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id ED9612019F;
	Wed,  1 May 2024 08:40:19 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1714524021;
	bh=zJQzXU9x1sjXKAGpnk6eIjFw7BY17yTk/9bUubCsTik=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=HyrK8Lv0ghgtTtEIOZHMO/90+vGKuDV9vztOw6uCkQ/eDojtTkPWP4lAr+IFS2TvG
	 +T6Hyj5GQSkxkLejts2s3gOJKWNJP/j0E7qOqW70G7HdwhTCfb7IvQO4csBAgLDCsm
	 k9hjiEz3sENbg8Z8GzkTxdmGlyRCafEcqWce5jzUKzn0ptzWMBQk2DqT2FGHtSc/k3
	 Mt3jMgi4OZi5R4pFWOt+IjCkuGYCg01gDJmNB4bgDKkITtG61ZvJniPBuaNkGvFoFs
	 6IdLF2aR1hH9k2pF2XNOlb24VVhmzoCEubuMLXygYEM83HGHqdkJvB1rNtXOAyt4nh
	 hO+BFeDAquOxQ==
Message-ID: <4f3ce3439e3d996471085e906902e508528308d3.camel@codeconstruct.com.au>
Subject: Re: [PATCH] dt-bindings: mfd: aspeed: Drop 'oneOf' for pinctrl node
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: "Rob Herring (Arm)" <robh@kernel.org>, Lee Jones <lee@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Date: Wed, 01 May 2024 10:10:18 +0930
In-Reply-To: <20240430172520.535179-1-robh@kernel.org>
References: <20240430172520.535179-1-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 2024-04-30 at 12:25 -0500, Rob Herring (Arm) wrote:
> The use of 'oneOf' to include 1 of 3 possible child node schemas results
> in error messages containing the actual error message(s) for the correct
> SoC buried in the tons of error messages from the 2 schemas that don't
> apply. It also causes the pinctrl schema to be applied twice as it will
> be applied when the compatible matches.
>=20
> All that's really needed in the parent schema is to ensure one of the
> possible compatible strings is present in the pinctrl node so that its
> schema will be applied separately.

Thanks, I think it improves the readability of intent in the binding as
well.

To understand the impact better I grabbed the patch and diffed the
output of `make CHECK_DTBS=3Dy aspeed/aspeed-ast2600-evb.dtb` before and
after applying it, but there was no significant difference in output.
Should that not demonstrate the errors being cleaned up? If not, what
should?

Andrew
