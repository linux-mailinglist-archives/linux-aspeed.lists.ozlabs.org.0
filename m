Return-Path: <linux-aspeed+bounces-4062-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KH8Hob8CmqA+wQAu9opvQ
	(envelope-from <linux-aspeed+bounces-4062-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 May 2026 13:48:22 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A530356BEE2
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 May 2026 13:48:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gJwzk6Yscz2xpn;
	Mon, 18 May 2026 21:48:18 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1779104898;
	cv=none; b=nCIQt2m6nm/RrxVuKwV99JsMZdCAlKytI4uZS25i34NPNhD72YAf8nakUhVKwA5sEBZ1dEmowuOHhzEIVLUCI+UGLi0smQk0ryuKAb1UoQvId9zXMPd8XqnY86tGHfzm78qUo9+rPjGcQk5+K5ZOuK46SqX3f5P3I2IBUrlyveeodFOJUgK95lvj8YnXdevsKsSJ2PmIclegR4dhzycSMi3+vblWTUCHMy4YKKa69O+H2yXYk+k4l2se13e7UCexbt9FR8PUNtBcIGGGbaHKqLyJDSxliPGwP0amLkzrdNxDauSuMmNZATDydUZyibrPDvx3SNbxmLDVl2hYCcAfHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1779104898; c=relaxed/relaxed;
	bh=RqVGUA3uSgAUjexcINA82gz5Nnz3mAqZB4EHGUzNSx0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NHDn9tq6mMKO6HyYGJYr+DS4Lfn4k+rhVgM5qKwpuP3f4t3DP3MXS9FPe20O+StvFSR/0bGT2g+ITIXV8SMVq4tT93pVwTL3LCFenTpUoqAqCCO3giIcfdvqRyqhCs9Q8LvdWkPGOsBn/YYUTI7byuwPmJW2KN+Ytx7KcM7wfNAqWkZc7C9sHOioIf+Dm3PtDWRZRE0mTfF2uKYxU4hoVs3pzzkLKO+oCRzR6G69WVI0m5r4W5UfFCsuaCPqzgLHwMCEL+KIziFriuFdieEuIVv0jZxHWjQwj6QGTs6BQK1ebFn2cmBhrfO9e0E0GhQgYL5ZFE4841Z13c2lgmhMwQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Xdhit/c8; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Xdhit/c8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gJwzk37Brz2xRw
	for <linux-aspeed@lists.ozlabs.org>; Mon, 18 May 2026 21:48:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779104897;
	bh=RqVGUA3uSgAUjexcINA82gz5Nnz3mAqZB4EHGUzNSx0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Xdhit/c8ZXUu6hclYtQqjI+ZOMKReIoKuek0qUDo64h9QYqlKaC0SJ8TGIA47m5NU
	 EldYK6ZYamgBeIRR7tMSb8ScpClPRYE4TW/372xHB7W4UUfiSWozN17herbMvVE1EO
	 u3QmYaJw/jFZ2l3zaYKjLvO67E84X0w1NDvgTZODvZW5l55wukjQuhOGLXx9D/UI1N
	 4jUAGFm9mZSRPMVNsKZ9AB1scpwT7gupExcmESL5l2pJFs97/WhAIg6GNDDeVVqfcH
	 +/d56zuLxI0wHiqIzZidd4xSQcsE38KryfYrEa4VIsLS6vd677xlBy6wd5r4TLWJ2A
	 Kagxg9eQLaKGg==
Received: from [127.0.1.1] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 696F56024D;
	Mon, 18 May 2026 19:48:17 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Rex Fu <Rex.Fu@amd.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260417-anacapa-pca9555-irq-v1-1-9a6d28b1b656@amd.com>
References: <20260417-anacapa-pca9555-irq-v1-1-9a6d28b1b656@amd.com>
Subject: Re: [PATCH] ARM: dts: aspeed: anacapa: add interrupt properties
 for PDB PCA9555
Message-Id: <177910489732.1782799.1747360209738224632.b4-ty@b4>
Date: Mon, 18 May 2026 21:18:17 +0930
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
X-Mailer: b4 0.15.2
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: A530356BEE2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[codeconstruct.com.au,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[codeconstruct.com.au:s=2022a];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-4062-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:Rex.Fu@amd.com,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[codeconstruct.com.au:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,codeconstruct.com.au:email,codeconstruct.com.au:dkim]
X-Rspamd-Action: no action

On Fri, 17 Apr 2026 14:41:49 +0800, Rex Fu wrote:
> Add interrupt-parent and interrupts properties to the PDB PCA9555
> nodes in the anacapa DTS.

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


