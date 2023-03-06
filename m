Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E25B6AD154
	for <lists+linux-aspeed@lfdr.de>; Mon,  6 Mar 2023 23:18:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVtJL72yGz3bjv
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Mar 2023 09:18:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SzES44sD;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SzES44sD;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVtJD42Dnz3bym
	for <linux-aspeed@lists.ozlabs.org>; Tue,  7 Mar 2023 09:18:20 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8DD1360DB9;
	Mon,  6 Mar 2023 22:18:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E19BAC433EF;
	Mon,  6 Mar 2023 22:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678141098;
	bh=PN5AY2wyPYtqlH5b3nTaGDv10G2DnDTm+a4N1JUGcWE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=SzES44sDkqfzNNkoYN9DLCujcq6LEGWBJk4u7rRlR2GWkkuwZwY9b0RtjhdhE12ia
	 nZyBRHL/2pIiuqpHUiPBZLxkXOZ9cF/64bH78nqI+4/k4VuDisiqID1a49s+jzjLvz
	 3XUfet5uZ6nh/tc0qybWlV1Pwh2foy8UCuxOOR1ABOcbvDoLzAtR+fzIC5e2cScM4n
	 IZ3ksCI1vBW/rfZANvQ9jX3wLhImxfMWhTIlyrUJepVfm4yy0KJhE5APpWaPu5BFhO
	 a6sRV5Qk80/vVWnSm27eyc4xUSReLaZqbmBo0H30RPSeK3U1378tpRnPBToSDJFVOe
	 fsY7aWNiWe4pA==
Message-ID: <4fc238f83c507735bac362e4dea9a0ef.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230302005834.13171-3-jk@codeconstruct.com.au>
References: <20230302005834.13171-1-jk@codeconstruct.com.au> <20230302005834.13171-3-jk@codeconstruct.com.au>
Subject: Re: [PATCH v5 2/6] dt-bindings: clock: ast2600: Add top-level I3C clock
From: Stephen Boyd <sboyd@kernel.org>
To: Jeremy Kerr <jk@codeconstruct.com.au>, devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org
Date: Mon, 06 Mar 2023 14:18:15 -0800
User-Agent: alot/0.10
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
Cc: Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Quoting Jeremy Kerr (2023-03-01 16:58:30)
> The ast2600 hardware has a top-level clock for all i3c controller
> peripherals (then gated to each individual controller), so add a
> top-level i3c clock line to control this.
>=20
> This is a partial cherry-pick and rework of ed44b8cdfdb and 1a35eb926d7
> from Aspeed's own tree, originally by Dylan Hung
> <dylan_hung@aspeedtech.com>.
>=20
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
>=20
> ---

Applied to clk-next
