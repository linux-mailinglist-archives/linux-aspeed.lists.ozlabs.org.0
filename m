Return-Path: <linux-aspeed+bounces-2982-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C00B9C7EF68
	for <lists+linux-aspeed@lfdr.de>; Mon, 24 Nov 2025 05:51:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dFD1L4SkNz2yvN;
	Mon, 24 Nov 2025 15:51:18 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763959878;
	cv=none; b=UDL4WvwpxydwobtLyv31AbBF6MQfZQMonuhWsaZOn74w1o5NLngMFYlvjnS43XAMKm/WjUhzLjs10qqjvZLIDnFO6Z2Cf+17JKRZUCHBlLKdAlwnH+laWY8Rwd5WhL+UYSFb1VyXYY/yYEO69Nc/Zlzm8/03txndHipjJyAMYa8rLnAAde8nsnYOiiwPQWDR42wLh8p2L/vDVflV3Nx1qFPKgX4SnU2iVHcLWwH0lOKzgnEgbtGzrlYlB/lNcEi8SA5RaWfHP+PM+XpyFSZcw70GHvk3aO0j1B29W2KXEBXAQ/7miQEm+J7G9JwnKGIArHpn8lq+OksUzyh5e/Kq/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763959878; c=relaxed/relaxed;
	bh=yLoLSRS0goZRqoYuNJwGXmkVYLQAq/toqhyMWgS8220=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mBqB8wtoT1YW48xEjIR5YteLnvLTdllYj3dU0evDHjGcMZ82gBm7Br2XRehCCSRlTtpikztkLIi9jQQBuESC3VrPVxjEAAIRLVsPTLb9gHumnkzKRZXlnmVW2inLYv4SC+o3aE3XIOdmaEAUv3ZsSFPRg9jKgRjivLWYiYhapiiDlkTB+a1t6SbC3TBV3X9tj3znTV8U4aRMagkm+UsSNpp5u2OnqoGIAndeSc3ft27Lz7ywt1I743raA2af5qwFOGG/9y1mnxhQAuErBt962xwIDh9ReJhAy0u6Fj2tNqa5aJp8PWUMwCQ6TKde/DXRcKHlbCnTXNKT6PM8cla1ng==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Ffh9O5Z4; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Ffh9O5Z4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dFD1L0CYLz2xQs
	for <linux-aspeed@lists.ozlabs.org>; Mon, 24 Nov 2025 15:51:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1763959877;
	bh=yLoLSRS0goZRqoYuNJwGXmkVYLQAq/toqhyMWgS8220=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Ffh9O5Z4zQOoVQ0ABvwI0KKeOL6UzL2f6GCv9mGCKKCeG5B+mEvRKTyG4PFLqGmKT
	 s2yOZcU0nGAX9ueJhruJ34RTQiXEgLprVIWQWgEJDMMLo+lOqffM/7tu8zrnMcspCA
	 J17VOp1nyY9WRyZ8N8aE0LbAM4GDROb3Vad4Mnqcg4/a1DqkW/Ods20hqqFamidsyj
	 XEC1lr1xAGJS5/Se0ozi0YLaJBZNslQG3GtopB0eBwDy2v+mbbuSG8LStQdj2I9yRa
	 R1Stg6GMlRXwy0rg67a2UIi/X+hkziWoBUnqT3ZDZNuTkzKPb5AAz4yuwG3sFRTin0
	 RiZ+JMy37eaMA==
Received: from [192.168.68.115] (unknown [180.150.112.38])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B96F864DF5;
	Mon, 24 Nov 2025 12:51:16 +0800 (AWST)
Message-ID: <430d2ae7b148534ca6277c7066304e35a25ef682.camel@codeconstruct.com.au>
Subject: Re: [PATCH v7 1/2] dt-bindings: arm: aspeed: Add compatible for
 Facebook Anacapa BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Peter Shen <sjg168@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Joel Stanley	
 <joel@jms.id.au>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, peter.shen@amd.com
Date: Mon, 24 Nov 2025 15:21:16 +1030
In-Reply-To: <CAJTz7Jd_fuTXpsseEE_161a7nLgoh4g9nH7M__HTsGihqNLQWA@mail.gmail.com>
References: <20251112211248.3711889-1-sjg168@gmail.com>
	 <20251118041058.1342672-1-sjg168@gmail.com>
	 <20251118041058.1342672-2-sjg168@gmail.com>
	 <c061ee38-5026-497d-b757-b0b9db2e6729@kernel.org>
	 <CAJTz7Jd_fuTXpsseEE_161a7nLgoh4g9nH7M__HTsGihqNLQWA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
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
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Peter,

On Tue, 2025-11-18 at 03:11 -0500, Peter Shen wrote:
> Hi Krzysztof,
>=20
> Thanks for your detailed explanation. I apologize for ignoring it earlier=
.
> I now understand the importance of Acked-by/Reviewed-by/Tested-by tags, a=
nd of
> not attaching patchsets to unrelated threads.
>=20
> I will follow the proper process from now on, and also fix my local b4
> environment so that generating the correct trailers works smoothly.

Can you please apply Krzysztof's tag and resend the series as v8,
separated from the v6 and v7 combo thread?

Thanks,

Andrew

