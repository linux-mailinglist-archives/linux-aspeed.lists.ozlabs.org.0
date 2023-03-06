Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C7C6AD151
	for <lists+linux-aspeed@lfdr.de>; Mon,  6 Mar 2023 23:18:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVtJF5TgSz3c9s
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Mar 2023 09:18:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Hob+OCcH;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Hob+OCcH;
	dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVtJ52nS9z2xG9
	for <linux-aspeed@lists.ozlabs.org>; Tue,  7 Mar 2023 09:18:13 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 09339CE17B3;
	Mon,  6 Mar 2023 22:18:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 432DCC433EF;
	Mon,  6 Mar 2023 22:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678141088;
	bh=HHwREwgr7XzZ/KCzNNwwOJxP6lTWS/fbgtvNqWgvOtk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Hob+OCcHgGfzIIaZaVV/XuwakpfvJBrYe/VLpsD6cm0acT5wJ4eUGKxby7Rkt5XiL
	 EHPzRB30XSbyWWqxwH1MpP4DymD0cDvrvjLZ786gFCp1a92QgZ+jf2RkiN2f871822
	 l7T94gccigsrUBHZ6uA/v+IvhRBvJPpm7+J6UdCsiNc/J/hRQNdfeGcFpF80U7zK2J
	 9sDvREipOL/R7ww72T4sRw1zadmyo9sa4/qybQAs6Foom0anmrhTSBFnRppjJfu2Jg
	 MYQ8HGOzYDwzlw/D99yzjJngvBfv5d+OmY/eDz5IJfyuuG1W77n4eeyWg7gk1t35Nk
	 fdVJmwW5q7DTg==
Message-ID: <3fa10935df53baca5e4521f0fbe6f382.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230302005834.13171-2-jk@codeconstruct.com.au>
References: <20230302005834.13171-1-jk@codeconstruct.com.au> <20230302005834.13171-2-jk@codeconstruct.com.au>
Subject: Re: [PATCH v5 1/6] clk: ast2600: allow empty entries in aspeed_g6_gates
From: Stephen Boyd <sboyd@kernel.org>
To: Jeremy Kerr <jk@codeconstruct.com.au>, devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org
Date: Mon, 06 Mar 2023 14:18:06 -0800
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

Quoting Jeremy Kerr (2023-03-01 16:58:29)
> We're about to remove an entry from aspeed_g6_gates, but we won't want
> to alter/reorder existing entries. Allow empty entries in this array.
>=20
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
>=20
> ---

Applied to clk-next
