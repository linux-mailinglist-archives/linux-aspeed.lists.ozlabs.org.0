Return-Path: <linux-aspeed+bounces-3787-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDp/INXYxGnN4QQAu9opvQ
	(envelope-from <linux-aspeed+bounces-3787-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Thu, 26 Mar 2026 07:57:25 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0773330179
	for <lists+linux-aspeed@lfdr.de>; Thu, 26 Mar 2026 07:57:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fhF2T2kY4z2xd6;
	Thu, 26 Mar 2026 17:57:21 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1774508241;
	cv=none; b=HXDERT+o5OEbUu0Vc4XJE8WxIzDXHdxoM/PN6Djnqf0hhWdJgwnmFzpM5TVbMYREC5SKdYJ4G97ik+iUuz+l3HPrPI2EE+58sqME3uV/5+bGJY6PYXkoor3nQzluYBVHRHLiBK6h5H/bky4432csutsbnkpRQSqgl6c4v9fYWOka72c49KZFQx22AKmHCDG/virlqxAlgzdBDkpl/VgjvnyXw+RbwQHg0auR7WDOEpaKsMmjfJcVsL3uj1qo12uPDZZ3CZiGIKMKD9rmdkIJ1JudV4YIUV7bkPxDubBgm3zUAjYU3I7t7H1PGtEPbLdU+cEzyy0MEA1o+NdXOZgMig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1774508241; c=relaxed/relaxed;
	bh=U8tYPKzcvltGXfQ6L16pIF3z/zsa7nvHckK/DysYQCw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WnUYPadfPvM/d0fvg23Taxvevuxeccg/eJ/sRwWR981RM0mTbs9LPDGGx4wqFnkz19wdHaAGo8ZJubmmgv/mYJy+M6kfkYnBhamQqqF23kg6vVrSI/OOlC511yPxaHiOhu1DHb3U5lZwvr0iiy/jmMDXL2SDq5K1ctx78OL68TmVYxMlr6kiQ2BglxR3WQqi9dIg6DEalCEdmihf1+f5CgN1LTx7Y2VBtk1XCvytbXxyoF9+S0MHoG0Nk0vGz9nLYHXeZ++faGqjA47FH56KQ7QeMXKtXvClTT3nXaBPwZipRnkrWaIT2/mLq6LfLeBgkSzsCTkRbJ5fd3j/IakR6w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ZWCVvnep; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ZWCVvnep;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fhF2S6Fx7z2xS5
	for <linux-aspeed@lists.ozlabs.org>; Thu, 26 Mar 2026 17:57:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1774508240;
	bh=U8tYPKzcvltGXfQ6L16pIF3z/zsa7nvHckK/DysYQCw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ZWCVvnepCwKjXCZ+/zqNrIFnx8K/tZccf6sCu8lpiOGXFBuv1Kx1EFFwf8osfZOAL
	 4Qx/3keNYZhbxIe9LjoWIl2j5XVMU0Z6nt/P75jczebkxVql2pxVe6BXkskSVYpQLr
	 u2SNJ47/BsAQkaXAYqZc7M5B8iRtJjXejk34WV/vB8+YQVoRFAnWmTfTGj+EgvlNG1
	 hRjecmdPNnqJWgR9lml3cwNMr7Mr8Zu9yOyCDqT5W2DMF7otDfjwTv4hysS/u8Na2a
	 jWU/+5eZF/NXS0i2WBVPI+UltVC7t4n5zkb1PKOtNEB8sOOBArdxuvYGbd/oM+ky85
	 dQvl8nSgf28zg==
Received: from [127.0.1.1] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 0AD896597C;
	Thu, 26 Mar 2026 14:57:20 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: joel@jms.id.au, Julian Braha <julianbraha@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260322230223.1393885-1-julianbraha@gmail.com>
References: <20260322230223.1393885-1-julianbraha@gmail.com>
Subject: Re: [PATCH] soc: aspeed: cleanup dead default for ASPEED_SOCINFO
Message-Id: <177450823998.724052.17604536856953003576.b4-ty@b4>
Date: Thu, 26 Mar 2026 17:27:19 +1030
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[codeconstruct.com.au,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[codeconstruct.com.au:s=2022a];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:joel@jms.id.au,m:julianbraha@gmail.com,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[jms.id.au,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[codeconstruct.com.au:+];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-3787-lists,linux-aspeed=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[codeconstruct.com.au:dkim,codeconstruct.com.au:email]
X-Rspamd-Queue-Id: D0773330179
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, 22 Mar 2026 23:02:23 +0000, Julian Braha wrote:
> The same kconfig 'default' statement appears twice for ASPEED_SOCINFO,
> which is unnecessary.
> 
> This dead code was found by kconfirm, a static analysis tool for Kconfig.

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


