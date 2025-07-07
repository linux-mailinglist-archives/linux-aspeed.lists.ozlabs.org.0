Return-Path: <linux-aspeed+bounces-1657-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAB8AFAB89
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Jul 2025 08:17:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bbDXy2Jq3z2yQH;
	Mon,  7 Jul 2025 16:17:06 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751869026;
	cv=none; b=fazjcg1mxAiTFKNGrifV1GMNzJhoXZaCbhTNTX3zwwGdMlE+cJlFqY7VtHs78/TzPV+CC2Yq4KoEFQXtUT/Vi2+jVOsp4sefW8KnZLGXaWSwmcxABDeCGiKNOKSxwl6LQUrLy0PXOw7YkuxZUXhqa2QypRGnE55nbAjMm5q9jPvcxOj+hPKEkjtW9RZCK/24Nh20+kSwqeCasvd1mmC2HXL4eptivbrZfEY4taYJ5abJLXNx6gb/ldqumd35PkzaiVV5iEDqnbafrKYBQEA+gRj9cOpYmkTs5I6X+UYth5ksVaSHSt9NAYmChMcR2/lilXYgdtN16GpoH6ILwGa5Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751869026; c=relaxed/relaxed;
	bh=lSFBwZRF5fKpWkm4EIaVmpGIkE7mwsSJdwwm+9eiVeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MnHqrqKo07wr6WhC2UGMfKbjtV0wCNc/3pOF6fpOxXKc1arJXID8vuAS/vPNk7LVonbq2LKyqH+7JrOawgMHYrqs7WY6PVkHSMZ03AIFchrAR+NrzK0FOjwFmwejE95jOubN8/wJuMzrjMfsRyk6I6pr6q5HfAKsgZd/EM8SLcwT1mlj6zC0XhuU6alJE65vi3+ZbQt0XHr49oni+48vmEaVYamMacuO9p188UYGbrEiAwIe4GBj+RVZrTAJbUN+8yk4Z9rBvMcgrpiCl+1zRmw1uVrqrJ45jcYCxb+W80dl/qeV6yuLXo8KZL7y9OkmzXwEbcbEv/CbuNQEBrw77A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Q1CXJdEF; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Q1CXJdEF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bbDXx43ZWz2xQ5
	for <linux-aspeed@lists.ozlabs.org>; Mon,  7 Jul 2025 16:17:05 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 94B415C5904;
	Mon,  7 Jul 2025 06:17:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B05F3C4CEE3;
	Mon,  7 Jul 2025 06:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751869022;
	bh=lhxzKPvMbvLCdIvBc3l1/2og+QLpTeNSU1qnRGsO/28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q1CXJdEF4a9dZcgWl/ng2pagMHreJKakjs7JulyaC9OKRFjLhJlQTHKdFQ+dtZhvb
	 ubNvVWBvatb6Fz99PyHlhciLgozjrH+DjsUkNM21pMjkjFqIm88gNb5o9i0uQDGVFE
	 f5ZuRCnOgOe927KPZDm1ShrrvM/xTVJ2JN+Cis+FDA9VFzGIOWZmR5rj6FwtOfbW9Q
	 m0BBE5A5z4VPTQc6Pft28zjU7qy1sqyISET0lsM47ayIhSstowBWQZ8lQEjcG5RsU1
	 HnZpYYs2C2v148MY9FKiwe6CH9n2ckxLboYfDyNfGWKZvHoHycB+a4tmi0krOxgKpt
	 GhAlI3htgkS+w==
Date: Mon, 7 Jul 2025 08:16:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mo Elbadry <elbadrym@google.com>, Rom Lemarchand <romlem@google.com>, 
	William Kennington <wak@google.com>, Yuxiao Zhang <yuxiaozhang@google.com>, wthai@nvidia.com, 
	leohu@nvidia.com, dkodihalli@nvidia.com, spuranik@nvidia.com
Subject: Re: [PATCH v11 1/3] dt-bindings: clock: ast2700: modify soc0/1 clock
 define
Message-ID: <20250707-spectacular-platinum-hippo-9ab32e@krzk-bin>
References: <20250707011826.3719229-1-ryan_chen@aspeedtech.com>
 <20250707011826.3719229-2-ryan_chen@aspeedtech.com>
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250707011826.3719229-2-ryan_chen@aspeedtech.com>
X-Spam-Status: No, score=-8.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Jul 07, 2025 at 09:18:24AM +0800, Ryan Chen wrote:
> -add SOC0_CLK_AHBMUX:
> add SOC0_CLK_AHBMUX for ahb clock source divide.
> mpll->
>       ahb_mux -> div_table -> clk_ahb
> hpll->
> 
> -new add clock:
>  SOC0_CLK_MPHYSRC: UFS MPHY clock source.
>  SOC0_CLK_U2PHY_REFCLKSRC: USB2.0 phy clock reference source.
>  SOC1_CLK_I3C: I3C clock source.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> Acked-by:Krzysztof Kozlowski <krzysztof.kozloski@linaro.org>

Don't edit or fake the tags. You must paste it exactly how you received
it.

This needs fixes. I suggest using b4 in your workflow, so you will not
make such mistakes.

Best regards,
Krzysztof


