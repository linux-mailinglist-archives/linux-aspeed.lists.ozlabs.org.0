Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DBF6AD162
	for <lists+linux-aspeed@lfdr.de>; Mon,  6 Mar 2023 23:19:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVtKC3Dnxz3bmH
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Mar 2023 09:19:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ik4Xhk5V;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ik4Xhk5V;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVtK64gGFz2xG9
	for <linux-aspeed@lists.ozlabs.org>; Tue,  7 Mar 2023 09:19:06 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D7EE360F54;
	Mon,  6 Mar 2023 22:19:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D1FCC4339B;
	Mon,  6 Mar 2023 22:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678141144;
	bh=Udd1plpCDIyKEQO5mTltvEild/07bj6KCkIIKJWuIlw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ik4Xhk5VwcBXWg0KQDLQ8iA7lw1glj9W5wCj/WEXky0izIJx1YKeubJLmdMDJMMyM
	 /P7vR4+n99Ib4Nc8+Znr1YNElncBBnksUwJUHe+8ouppDavKwfReNTalXwRrYi+HQF
	 F8ypQlSAV/WGlwYWESbjxDe5dN198cicjdYUCRFIUaIDCSmYx6ZfJy00LDJ0XN6Ubj
	 /SPWKtOjfYZIMrLqFkpe9rZkRbTkAc5NQ2thZFdJSPQfr7WFvXd+BpkjDs1h7WUHpu
	 Keg8Z6YXO56oLzJits2oNrP8D8j6PzWu+5xxi2r08MDyTcmDu5ZavJsEqEq+XyiAWP
	 gGQ0EGcSxruVA==
Message-ID: <766e71a3f2f18af38377b50f6344e4e7.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230302005834.13171-7-jk@codeconstruct.com.au>
References: <20230302005834.13171-1-jk@codeconstruct.com.au> <20230302005834.13171-7-jk@codeconstruct.com.au>
Subject: Re: [PATCH v5 6/6] dt-bindings: clock: ast2600: Expand comment on reset definitions
From: Stephen Boyd <sboyd@kernel.org>
To: Jeremy Kerr <jk@codeconstruct.com.au>, devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org
Date: Mon, 06 Mar 2023 14:19:02 -0800
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

Quoting Jeremy Kerr (2023-03-01 16:58:34)
> The current "not part of a gate" is a little ambiguous. Expand this a
> little to clarify the reference to the paired clock + reset control.
>=20
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> ---

Applied to clk-next
