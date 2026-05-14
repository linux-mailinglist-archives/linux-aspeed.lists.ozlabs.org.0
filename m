Return-Path: <linux-aspeed+bounces-4028-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOfhCpPYBWoncQIAu9opvQ
	(envelope-from <linux-aspeed+bounces-4028-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Thu, 14 May 2026 16:13:39 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5094A542E1B
	for <lists+linux-aspeed@lfdr.de>; Thu, 14 May 2026 16:13:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gGXP84kV0z2xy8;
	Fri, 15 May 2026 00:13:32 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1778768012;
	cv=none; b=k87Gh+LHseBDijP4zYbwtIsxtyc/lbHTZ+OcFDbtT63zhOC1BRj6mc/o3b7oegJGujeKolmE9G3NokByZ2PEkwTBhzEu9SS489nJEvUoiU30Eg5UqebcvNsAyHfyusAI1g3/aUe0W/hjdd+KHD09WCZRGArQGafXkTlWHZIvACzfmGAtagnyO5fHUYZV52I/RVaGqPJxI0WRxziOSXak6TIULGNkX0ngyVhKLo65Ty//+VT6N0vbW5ib0wDozQxv3x47TXbGoQsFkH1lStGVFWS4nG5/UdpjmiaGBv03s7wST86j4G5eiUDthAMCbwBeIcIBwl4HsFSqcItIXhTpMw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1778768012; c=relaxed/relaxed;
	bh=/dr50uPO7eF9OrFOOFLaGBZ1ya8dzFvE9OZgobV06/Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=c4woiLSgnZ5Ip76mjSbp8eLKQkm+gyZXaqK+tac8uIPSRLcVWn9k+AA8noaBTzfrVQ605/oldbvJAK88ra8oLfz6TOgjGDhpM9pCsigc45OGOOdatPBx/KBdNp/3Q4hAh/FKAUy2998OBHje+EJUBBPUfVfJIbkI62Doz3CmF6I0t+mmqnhol/nD478UXFtaED6W1MqLSqLmKlDixzTb0knGoF2L4fhZHs/69T47NIdmPd419/xt55hDGhIZtNFOSXD9fObDuwWOinwlz9FbFshKXW/eu/efaGHwJug9+BZUYtF+BwbXK0SvTH1bkcptqw0vz0RzH4OB6i5Qjn56VA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XkEHt8uW; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=lee@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XkEHt8uW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=lee@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gGXP74nMyz2xFl;
	Fri, 15 May 2026 00:13:31 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ABC1D60008;
	Thu, 14 May 2026 14:13:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8635C2BCB8;
	Thu, 14 May 2026 14:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778768008;
	bh=vecM+NvydGm3n5aPBbo+HzeFwabzmwcQucOYFjvSKhg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XkEHt8uWWQKSBKZ28HG2MVM7OP5TcnsspKmi+712eDUBP08VVTF3q7cwbdL7vIDrL
	 P40fcVGnciFBb/xwmE+oj6q3lT4AGb/EwNz8qhuKp7AcviwDM9s/NqKv5OThLSZCqi
	 IHur3CiTebWzCJOq5EeAjzhZEs8uHJT5Qaav0rrqVsslds8y+y5gVGaKlwbDf5bO/9
	 etsbVV3oJG08NkrhZ5YkrLDojMKCL8Tfv+EGQH2RZjPeNXbJf3EfJX+Lqao/QtqF1H
	 2FSn4NyD+u4CVGU0G49LIMN0wOus1x0FawEKPtAVg6wbPCjbnWFNBkcqcvTP65RUBE
	 hdfoMDt2mAI7A==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
 linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260428-upstream_pinctrl-v8-2-eb8ef9ab0498@aspeedtech.com>
References: <20260428-upstream_pinctrl-v8-2-eb8ef9ab0498@aspeedtech.com>
Subject: Re: (subset) [PATCH v8 2/3] dt-bindings: mfd: aspeed,ast2x00-scu:
 Describe AST2700 SCU0
Message-Id: <177876800455.2774299.12102353346237716077.b4-ty@b4>
Date: Thu, 14 May 2026 15:13:24 +0100
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
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 5094A542E1B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-4028-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Tue, 28 Apr 2026 17:49:46 +0800, Billy Tsai wrote:
> AST2700 consists of two interconnected SoC instances, each with its own
> System Control Unit (SCU). The SCU0 provides pin control, interrupt
> controllers, clocks, resets, and address-space mappings for the
> Secondary and Tertiary Service Processors (SSP and TSP).
> 
> Describe the SSP/TSP address mappings using the standard
> memory-region and memory-region-names properties.
> 
> [...]

Applied, thanks!

[2/3] dt-bindings: mfd: aspeed,ast2x00-scu: Describe AST2700 SCU0
      commit: 821fe4172d2a220278d6d279b695b3e299c1614f

--
Lee Jones [李琼斯]


