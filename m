Return-Path: <linux-aspeed+bounces-3496-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eO4fMTUviWlj3wQAu9opvQ
	(envelope-from <linux-aspeed+bounces-3496-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Mon, 09 Feb 2026 01:49:57 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 071A610AC21
	for <lists+linux-aspeed@lfdr.de>; Mon, 09 Feb 2026 01:49:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f8R1F2WVSz2xN2;
	Mon, 09 Feb 2026 11:49:53 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770598193;
	cv=none; b=OknZShJR8bZO6lDIQ4NV9/UQ7auT6zQ9CahKI9HqNlPoSprfbxNJ2SJzpVD2bdgzSoxyM9NA0hPuCT0kLOkJF7nWdndpgcrfpaz9Oxlih32GH/+U+3xSEJMWu76wV6MxFpImGEuPaSIkTqvjJmb7XkTki8C0LLm+plSaXRcyKNggD0TlxZ3nq9aLk+D9k4lrfxyIZniuSd9NtWTPxyZ0cURGyiZoAoT9Y+wELbx5vGqMRGRAQr5zvNcjo0rqC7OBOKSBP+iQLUrPfa1O0K3DeT/gjuHgvD0lqbQixh1DeOzZcPvTgJhSL5qBow6ketXAlon5uQ1JuPjRsGDQnTb2Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770598193; c=relaxed/relaxed;
	bh=r7MCCqP45D0dY/QaEr0D6Ms9HT2gRvnzr4MI+SBARCU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=j7V4Pc1LGJDjAIyOzWOPgtjLIU4RAiNy5056VMUw6jzeLt3Nw01wdaRxLajwa/V3N32Xh0IxvFnx8Bh5Bu3UH1zE8sLGrlABkXE74UM0afJ2ZFeNEkeRR++Wa69bGJ374G/Ye7qXaXb5HaeBTIQ1nw0f9ffqWMaP+k5f2Gxjm/5EE8Ei5HG/x2xpOh21GQaV4TQ8stXU7iRKJkfOHIVgp+tmKLHvYLpf4BSgXX63P7v/P1hjU2vRPhj7fBBHUlRlujg5xI54KNxIEd9tIPPw1jYs0Vs40JpKf9HlZN/qnF8yXql1rSvBt1f1RPlBh2lDSixIWISdtAiXa3+exqnS1w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Qsv95FT3; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Qsv95FT3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f8R1C42lDz2xLv
	for <linux-aspeed@lists.ozlabs.org>; Mon, 09 Feb 2026 11:49:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1770598189;
	bh=r7MCCqP45D0dY/QaEr0D6Ms9HT2gRvnzr4MI+SBARCU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Qsv95FT3JdSqVtCZt3NjwNcCnqE7TpLFpUEwRs6P6zgVBZepyXw4WDPudVkrI+rlI
	 +DXpoZSJPRHqZ7iytabmfOudbuTL5Se9YCVItkelw2W0caa3RjAM5gagZlCmXBk84T
	 9N38H53KsEEJ3lCDRxmmEMx3LyLm3Zg9g3PpJgC5z95PqkrNDLcTMQDBRttEESbign
	 CD0XUf2CM0ofN1ZTC7ztpbtxQiK9bhdHkNYGBVj9f5Efe8a22do6Eh4DUiO+sIuvt9
	 xtk3UdqIdqPTpNQMosbHFMN0JUkEy4s9jJiSUmc0vulrOd0WImOP1GKfq/NJgsuTdT
	 tvYnDJS+HrL3Q==
Received: from [127.0.1.1] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B77AB60360;
	Mon,  9 Feb 2026 08:49:46 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Anirudh Srinivasan <anirudhsriniv@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260114-asus-ipmi-expansion-card-v2-0-12b72d20a9b9@gmail.com>
References: <20260114-asus-ipmi-expansion-card-v2-0-12b72d20a9b9@gmail.com>
Subject: Re: [PATCH v2 0/2] Add device tree for Asus Kommando IPMI Card
Message-Id: <177059818618.793195.12078369893551899945.b4-ty@codeconstruct.com.au>
Date: Mon, 09 Feb 2026 11:19:46 +1030
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
X-Mailer: b4 0.14.3
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[codeconstruct.com.au,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[codeconstruct.com.au:s=2022a];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3496-lists,linux-aspeed=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[kernel.org,jms.id.au,gmail.com];
	FORGED_SENDER(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:anirudhsriniv@gmail.com,m:andrew@lunn.ch,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.970];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[codeconstruct.com.au:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,codeconstruct.com.au:email,codeconstruct.com.au:dkim,codeconstruct.com.au:mid]
X-Rspamd-Queue-Id: 071A610AC21
X-Rspamd-Action: no action

On Wed, 14 Jan 2026 23:31:06 -0600, Anirudh Srinivasan wrote:
> Adds support for Asus Kommando IPMI Card [1] [2], which is a PCIe card
> with an AST2600 on it that provides BMC functionality to any host
> without an onboard BMC as long as it has a PCIe slot. The model name
> Kommando is based off the model description in the vendor fw.
> 
> Currently supported functionality includes UART, booting from SPI,
> KVM functionality(usb gadget for host, reading VGA framebuffer from
> host) and LED/Power Control via GPIOs. NIC support is not included,
> requiring additional patches which will be sent later on [3]. The
> entire BMC functionality has been tested on an OpenBMC build
> available here [4] (which uses a modified u-boot device tree [5]).
> 
> [...]

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


