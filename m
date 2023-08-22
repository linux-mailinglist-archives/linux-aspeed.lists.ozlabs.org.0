Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2243E784BBD
	for <lists+linux-aspeed@lfdr.de>; Tue, 22 Aug 2023 23:00:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GZpOGvaI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RVhZn0Lhbz3c09
	for <lists+linux-aspeed@lfdr.de>; Wed, 23 Aug 2023 07:00:49 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GZpOGvaI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RVhZd219Wz2yhS
	for <linux-aspeed@lists.ozlabs.org>; Wed, 23 Aug 2023 07:00:41 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7AE7D612C5;
	Tue, 22 Aug 2023 21:00:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF9C1C433C8;
	Tue, 22 Aug 2023 21:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692738036;
	bh=Bfl9Q+5PUYbGX93gC/p5dsy9+HHVDK69a8BX8HMEtCU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=GZpOGvaIQjPh2lkGmj4jrgl7PGiUtpu6L07cneYELTEjIgB8Hz1gzNwk2c9ObPAmq
	 viXdFFEbVNOD43Gz6sCjHQZxQg2e7OAsXHdD+UyK/NKk2j7zavpWtjgyY3YFxBAuUD
	 C5fTdTtWEBm/Czz5ibqpn8wVDDdGM4w+3QQD9eLk02gSAZZ/ZASO+1gq+pRPVfL/g6
	 0CJ6lGLxQyjRE+GQwlQ81qbXHjZLqOlRNZzGVBv0zyniq/nrtBm6+rbslW53DAMctp
	 K1pnfey+QNClhJ3zugG68htX/BGAUZW0g8Wva8QEjsr86rP7rP3X/BOzWOYRu6JmnN
	 IIym9YlDIldXQ==
Message-ID: <cb4f740cd5bcb6c9b19ce970d8573388.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230817203019.never.795-kees@kernel.org>
References: <20230817203019.never.795-kees@kernel.org>
Subject: Re: [PATCH] clk: Annotate struct clk_hw_onecell_data with __counted_by
From: Stephen Boyd <sboyd@kernel.org>
To: Kees Cook <keescook@chromium.org>, Michael Turquette <mturquette@baylibre.com>
Date: Tue, 22 Aug 2023 14:00:34 -0700
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-aspeed@lists.ozlabs.org, Tom Rix <trix@redhat.com>, llvm@lists.linux.dev, dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org, linux-phy@lists.infradead.org, David Airlie <airlied@gmail.com>, linux-clk@vger.kernel.org, Kishon Vijay Abraham I <kishon@kernel.org>, Samuel Holland <samuel@sholland.org>, Gregory Clement <gregory.clement@bootlin.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>, linux-sunxi@lists.linux.dev, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Kees Cook <keescook@chromium.org>, linux-arm-msm@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, Nathan Chancellor <nathan@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Qin Jian <qinjian@cqplus1.c
 om>, Bjorn Andersson <andersson@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, Taichi Sugaya <sugaya.taichi@socionext.com>, Vinod Koul <vkoul@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, Takao Orito <orito.takao@socionext.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Quoting Kees Cook (2023-08-17 13:30:22)
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
>=20
> As found with Coccinelle[1], add __counted_by for struct clk_hw_onecell_d=
ata.
> Additionally, since the element count member must be set before accessing
> the annotated flexible array member, move its initialization earlier.
>=20
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/c=
ounted_by.cocci
>=20
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: Taichi Sugaya <sugaya.taichi@socionext.com>
> Cc: Takao Orito <orito.takao@socionext.com>
> Cc: Qin Jian <qinjian@cqplus1.com>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Gregory Clement <gregory.clement@bootlin.com>
> Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
> Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Samuel Holland <samuel@sholland.org>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Kishon Vijay Abraham I <kishon@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-aspeed@lists.ozlabs.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-sunxi@lists.linux.dev
> Cc: linux-phy@lists.infradead.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---

Applied to clk-next
