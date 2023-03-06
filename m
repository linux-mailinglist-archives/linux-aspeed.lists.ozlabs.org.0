Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AB26AD15E
	for <lists+linux-aspeed@lfdr.de>; Mon,  6 Mar 2023 23:18:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVtJw0ZCGz3c41
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Mar 2023 09:18:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ARx8HmPt;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ARx8HmPt;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVtJq511gz2xG9
	for <linux-aspeed@lists.ozlabs.org>; Tue,  7 Mar 2023 09:18:51 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E466660F54;
	Mon,  6 Mar 2023 22:18:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B215C433EF;
	Mon,  6 Mar 2023 22:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678141129;
	bh=drPE2tfS83JBT+QhIwghT7rQZ/+Cdkequ9Dh2QXOkq0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ARx8HmPtoLZ9fzcCotD+7fE25isz2AC0zd5YIdesxYdBf2zutOcyTDDxSKtmZ8ogb
	 wS379NDFTRbEU99ixOPTLIw1eEf+1vwP77UmLzJ5slVn1T7dgaPehRcrqTkManRVQU
	 zHNSEPj5BdD9cIlGIoJ8CLXt4iVMqQExrLRzjsZ9u3G9Urfcqv7IVx0n8Gq7PiRRtC
	 iXHUU05l6aZ+TMN8+3JP8ObFfJKx83Lj5VUVnLrA0J8X78ff0auUdZA+Hq/mw74+Vw
	 JYrE++IO9hNmpjHh3Xs8mmCNiIvMxN/BTfs3kuD6Xea49qInSbXmaaYoRpptGcyNEM
	 2b3uCrr9mkQaA==
Message-ID: <cc6a0ded69becc0b3f7e9ac5190d8f64.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230302005834.13171-6-jk@codeconstruct.com.au>
References: <20230302005834.13171-1-jk@codeconstruct.com.au> <20230302005834.13171-6-jk@codeconstruct.com.au>
Subject: Re: [PATCH v5 5/6] clk: ast2600: Add comment about combined clock + reset handling
From: Stephen Boyd <sboyd@kernel.org>
To: Jeremy Kerr <jk@codeconstruct.com.au>, devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org
Date: Mon, 06 Mar 2023 14:18:47 -0800
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

Quoting Jeremy Kerr (2023-03-01 16:58:33)
> Add a little description about how reset lines can be implicit with
> clock enable/disable. This is mostly based on the commit message
> from the original submission in 15ed8ce5f8.
>=20
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> ---

Applied to clk-next
