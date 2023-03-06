Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C536AD157
	for <lists+linux-aspeed@lfdr.de>; Mon,  6 Mar 2023 23:18:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVtJV2HKVz3bfk
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Mar 2023 09:18:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Mhwcq1FS;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Mhwcq1FS;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVtJQ3B45z2xG9
	for <linux-aspeed@lists.ozlabs.org>; Tue,  7 Mar 2023 09:18:30 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A5B7160DB9;
	Mon,  6 Mar 2023 22:18:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F31F8C4339B;
	Mon,  6 Mar 2023 22:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678141108;
	bh=L4mv6MrZOY5f6HNm/5OVbuyJRl13tukz+ou2OJNeU3Q=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Mhwcq1FS0aOZBZcXkfWxMRVwNWfeKzQSqGfTkx0zR2AjAnO5N6UUXm6039IKx7aVM
	 MNJiULEqTwtoGP3lCnxU5qxmMHItSE5bo9Gx+h8QiQmr+SbVbaX8kVQrCbZStpesQ7
	 C+cEB+Sd1afog6KLpgdNtqaNEvUcNQ4tuCw3zR2TCchC2g29cqCu2zMJ1yqiMScFHV
	 spcn8SXh8iUaXC0lggqF8etv9Bo3cclfua3GruhbLQlzQqyEa1BQ0Jba20zvcmT6Rh
	 4MXvk2VEkGEP1/3G2ahU9DZaIVp2wiazmlVmNx5A6M+CEXAPf/BZW9MPxU1IL3TXDp
	 73wUxe2srN0Aw==
Message-ID: <3a8f668c9b1517ac00bafebda8f2b58f.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230302005834.13171-4-jk@codeconstruct.com.au>
References: <20230302005834.13171-1-jk@codeconstruct.com.au> <20230302005834.13171-4-jk@codeconstruct.com.au>
Subject: Re: [PATCH v5 3/6] clk: ast2600: Add full configs for I3C clocks
From: Stephen Boyd <sboyd@kernel.org>
To: Jeremy Kerr <jk@codeconstruct.com.au>, devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org
Date: Mon, 06 Mar 2023 14:18:25 -0800
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

Quoting Jeremy Kerr (2023-03-01 16:58:31)
> The current ast2600 I3C clock definitions are top-level (rather than
> based on their actual hw sources: either HCLK or APLL), and include a
> couple of definitions for (non-existent) i3c6 and i3c7.
>=20
> Re-parent the individual I3C controller clocks to the main i3c clock,
> explicitly sourced from the APLL rather than whatever G6_CLK_SELECTION5
> was last set to.
>=20
> While we're at it, remove the definitions for the i3c6 and i3c7 clock
> lines; this hardware isn't present.
>=20
> This is a partial cherry-pick and rework of ed44b8cdfdb and 1a35eb926d7
> from Aspeed's own tree, originally by Dylan Hung
> <dylan_hung@aspeedtech.com>.
>=20
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
>=20
> ---

Applied to clk-next
