Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4916C9899CD
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Sep 2024 06:42:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XH7hk1RVzz2yQL
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Sep 2024 14:42:14 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727671332;
	cv=none; b=KumwSanCwYZM+4+hI+fdsc8D51VTI6E4sIxhYXCijTLf2nS08F0ryxsxCJeQ9OfcssqWxWWs68BUMbOIZjQa7atnG3Gqaq0A9lQ9G6TPoosLdE0WxIscmeQ6Jwtwp80bddwwEzaOmC3H3LADsb11pwNed9hzRPROsYTAFiEPmMiGqAyIJ8PmqiQdL3ElGBAxsWw8s0wrkI66riTN9/55TQT2N222KODH2C8+w6JDW9vR4xrfFW2NhKfilsIsKB3WMenRLeAgna5n42Uh8jtd44i5gMQ/vZtenWuA7thqBiMGPc8qCy/W1DfKdqMLyNFplj4ckLpVzdJ68IzkRuz30w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727671332; c=relaxed/relaxed;
	bh=joHW7jrOhmrAROOCAZBufariLP1pqxOlWm9X0knNZss=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bjglKcVj55pE8vNo7yMZklrInkfGkidmqH0pIvhMoocm+uzhMaZ2Yg++j9lQj24V9zwaY0OkS4AxD/QPHwmmr6zSbWr8P1N4K3eIu8tKc//PY329Hb1RxUI7BCxs56pVcherAyFgdjLbkaa+zxTMmEoLK4FlwUKYIRMQ3fWurlLcGPm7On6PCauUVsxe5XY1bfQG3GeQ83LfhrwLhGxizbq58tVFfc3Y5oPI5LEghCIsKASi3ViqD5LiUxEJVaHI0Sp9nBlW8adWE9jVPqmvwwLbRYDUpyu98WpqQNpOBmkFcHtYygnjMHgN5ZrL0sxfVbx/iK9z2sLKKthPz4ELQA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=j6/8F3el; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=j6/8F3el;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XH7hg6mqJz2yK7
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 14:42:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1727671331;
	bh=joHW7jrOhmrAROOCAZBufariLP1pqxOlWm9X0knNZss=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=j6/8F3elrorW0Rsh6GSADnXcfAcn/PrJnerLVa7YgrLFMw3AHRkh15Ut87bjSSOqG
	 C/CpDp7c1+jTIpuGtR2V4TD2WIdefE9XYbRd8tg+2CxIzCngaVVhRajntB3mTOFjfg
	 gZhQ/jErMDOvbgUo8HhdE7qDn+FanapxT/BAy4dmUGfq8xXIldj08IK2CvKt/UP6e8
	 pcL/XzUsm8UHuf870ow9BGkg2nX3pOpBXuNScNGNT0rgnCJhSLAIPdTFS6AvH3FZxP
	 +yFxaZCXqoT4d9qHfp8cNMD+r3j9VM2gztOxyv4A4bw3EPlINi3py87ASdyvzMUuaY
	 5gT7EikL7LaHA==
Received: from [192.168.68.112] (ppp118-210-73-17.adl-adc-lon-bras32.tpg.internode.on.net [118.210.73.17])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 5E0456511E;
	Mon, 30 Sep 2024 12:42:10 +0800 (AWST)
Message-ID: <3a484923ec6fce4a3562b4bedaf846b2ae2ffee7.camel@codeconstruct.com.au>
Subject: Re: [PATCH v6 7/7] gpio: aspeed: Use devm_clk api to manage clock
 source
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Billy Tsai <billy_tsai@aspeedtech.com>, linus.walleij@linaro.org, 
 brgl@bgdev.pl, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 joel@jms.id.au, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com,
 Peter.Yin@quantatw.com,  Jay_Zhang@wiwynn.com
Date: Mon, 30 Sep 2024 14:12:09 +0930
In-Reply-To: <20240927111744.3511373-8-billy_tsai@aspeedtech.com>
References: <20240927111744.3511373-1-billy_tsai@aspeedtech.com>
	 <20240927111744.3511373-8-billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.0
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 2024-09-27 at 19:17 +0800, Billy Tsai wrote:
> Replace of_clk_get with devm_clk_get_enabled to manage the clock source.
>=20
> Fixes: 5ae4cb94b313 ("gpio: aspeed: Add debounce support")
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

Though as noted in patch 3/7, 7/7 (this patch) and 5/7 should probably
be ordered before 3/7.
