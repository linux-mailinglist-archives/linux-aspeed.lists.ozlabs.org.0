Return-Path: <linux-aspeed+bounces-4136-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGaCIZxiFmpTmAcAu9opvQ
	(envelope-from <linux-aspeed+bounces-4136-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Wed, 27 May 2026 05:18:52 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D027D5DED36
	for <lists+linux-aspeed@lfdr.de>; Wed, 27 May 2026 05:18:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gQFFh46NLz2yTH;
	Wed, 27 May 2026 13:18:48 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1779851928;
	cv=none; b=oNfUDVSn9OjCtz/+2P2GNn1GD03jMyxsYeAde75CuCbAL5mA0b/VvNwTs0BP/8MNPPy2sWpQqCYIaHYWNi6IOSrxsAiZjvyfd+dMH58Kxo680xN+7xaW5v5ZOs7HcCMw6Z6xAyTmIT3igSItf7s5u4DlWiC4ty/watSmd4OTkgAJGvcqsON5mrqn/pPV6Ew6ajYAcTFp3ItG3hqhJcQORYh2fo4x1hAVRNBqRzOK0C//1gkXcxKksZ22XzuKTBylYpw5PgBd+RXriPvmLmNKxkMizoGowL9mwI6g3c9MU75CPGWKxpbocHmTSwuFLD5KFoEx7fMXawlDI0M9nsY9Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1779851928; c=relaxed/relaxed;
	bh=zJU8EAC9I7Spvd0nK3+SuI/L+eH9UzP8lKuPKonV7lk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=omspRHUyIdHpcjUACF9zXBtfcJSQ3lFyongAdVpT0jVEqJnGBf0jUc8pMOK9ztzFPWG6WY/DCq+R2bok1lnDsOkFq5DD92bXEworeo99vojvMRTcaXX2OjKj1doS85p9x/P75208TdrrvyemTFTHlJg5uZ1AgXx8Jdi0AaxbJU06YDHKKfzL27tffsGt866NU5Txu+CohKHf1NpTQfkE9UN4TU/ldod0mlPyd7ODp9RdXLdzKiurbfGJbyXAwfK7wwCAyn7M4V79cFQPgL+xjM88QRyGAyeYRgbNBch1c5+AtU2RA1bBZ5GN2yLzWVKUUy+3WQ3JmKJ0r3U4Cia0Fw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=igtWyFI4; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=igtWyFI4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gQFFg60JDz2xtC
	for <linux-aspeed@lists.ozlabs.org>; Wed, 27 May 2026 13:18:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779851925;
	bh=zJU8EAC9I7Spvd0nK3+SuI/L+eH9UzP8lKuPKonV7lk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=igtWyFI4rXsCZDEXA0z1LVxggWUxjy5e7qIQWXxdVYIY+6OqjUNjbwEjoxxUra4r6
	 kujgGJKcVPyV2jB8Pxr6Qx8fL3TpnII9O1zjy/4Sdn1s9VJL2A43Rj8bM7pA6NvWQC
	 nzXCDqaFOBKifl9Trm7SNdtyq9dojbxLyNz3irLaOssUL60FDZp1VCNqdIyPxgUS/Y
	 5/TbtsPbflpvLqAh9ozZ2LvAYWsF9saU/WJ8jATIE27YZtkxQM8wvf5zVmv2zio16h
	 24r9DkzcnalRQ+MxDU17eYhOymUzmNs0xO3lxKNwJWjJWr+rrt/Ld/uPs3MSQWYVkm
	 ZtoMgDU6dZOHQ==
Received: from [127.0.1.1] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 8729D6001B;
	Wed, 27 May 2026 11:18:44 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Patrick Williams <patrick@stwcx.xyz>, Potin Lai <potin.lai.pt@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, 
 Potin Lai <potin.lai@quantatw.com>
In-Reply-To: <20260523-potin-update-sanmiguel-dts-20260522-v1-0-169f5fceb5f9@quantatw.com>
References: <20260523-potin-update-sanmiguel-dts-20260522-v1-0-169f5fceb5f9@quantatw.com>
Subject: Re: [PATCH 0/2] ARM: dts: aspeed: sanmiguel: Update DTS file
Message-Id: <177985192444.444390.3815686212940487089.b4-ty@b4>
Date: Wed, 27 May 2026 12:48:44 +0930
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
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[codeconstruct.com.au,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[codeconstruct.com.au:s=2022a];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:patrick@stwcx.xyz,m:potin.lai.pt@gmail.com,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:cosmo.chou@quantatw.com,m:Mike_Hsieh@quantatw.com,m:potin.lai@quantatw.com,m:krzk@kernel.org,m:conor@kernel.org,m:potinlaipt@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,jms.id.au,stwcx.xyz,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[codeconstruct.com.au:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-4136-lists,linux-aspeed=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo,codeconstruct.com.au:email,codeconstruct.com.au:dkim]
X-Rspamd-Queue-Id: D027D5DED36
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 23 May 2026 10:28:06 +0800, Potin Lai wrote:
> Update the SanMiguel DTS configuration to fix incorrect GPIO
> linenames and resolve the IOEXP interrupt handling issue.

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


