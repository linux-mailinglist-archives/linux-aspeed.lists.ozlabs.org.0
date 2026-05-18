Return-Path: <linux-aspeed+bounces-4067-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EF3rAfsGC2r4/QQAu9opvQ
	(envelope-from <linux-aspeed+bounces-4067-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 May 2026 14:32:59 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 321B756CB89
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 May 2026 14:32:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gJxzC6MWgz2xpn;
	Mon, 18 May 2026 22:32:55 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1779107575;
	cv=none; b=Pu4l2X/Sk2q2cFM9Qel2u4eeHj/hUVZW5WkzTLaGK/kevxxr6PKkI6G3RQihe1iFKNxGJm/XsCr+0BVCDRzZJkaYejLH0u9jd83ROidr1MI+FT/7NSxSDFdk3KTxfXQzI7DAn6QOZCZIlu2Kzg6fEMpkmBgl20XTY5NW+5vf3gjjnWlJ65ib+Ob/6HPJZ4j3kzSBOziTrb2OuQaaCaUoLxEzuNpSVH/UECg9cfLjPXoCi1FjcPtgeYEtIoYdzp+Zmjpyd6O+vEMAisOeCYJMoudXxBz/y50K1n/6F5mGH3uSxv8QJzGtGWSGWTiFyU0+RJUJUvWQIs0BuMVvaHaHjw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1779107575; c=relaxed/relaxed;
	bh=elZboa60W0l96YHBweGgGvjS5bMO7+rmrRZ0Og9GkKg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dHIjxvxZeLtkn4fMaHTG+hGPgG3Q6fJP4N8wyOEjaqhNIhu27pzrM0nhCpMvlFNtam0sqhpQdObbBR6wRGrl05lh6rElz/GaZNj4BWtNsruHlN8YKChOjqdSTy2GvJNK+5QJJ9YTqQpmAdQmcMrIkqRYQK05B3winMhik8FIrY2u+7iZsHAv0MGx52N7/76qHXBGmpAx3S1MQmsajq5VW5NebEyuYsTdQbGVeenoJpkhE/p17rngi11Ocyz9Enxgh64WEsMt9GR/G5sXLGO/mCVzwoYMT/J05FavR0MdybJXel3WBCdcreWv3hk9OleNCQyPEGdJ5crZqP1I/cKaIQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=VVXe8bcd; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=VVXe8bcd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gJxzB5WyFz2xPb
	for <linux-aspeed@lists.ozlabs.org>; Mon, 18 May 2026 22:32:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779107574;
	bh=elZboa60W0l96YHBweGgGvjS5bMO7+rmrRZ0Og9GkKg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=VVXe8bcdr8e3oLxsXRO+S/CqsgNrAYlHzNMC8MHgMfpiXPYRfIljG3Uj0CuGd9tEE
	 LYdjNoSTbJG/XzayYLR7ggKfb2RsYRlwumBGLzZA3AXZUxfXrMdL4J3VKZjkf+scU+
	 +D3GPymW0SVfw5MmkTXdW12gF2ZUlx5UctiERtufaufsK+Wkiyq2+PTJZqAnfI+4Iw
	 lsRlI+WaKxDQUTDaEhVTWDbzHR4v0la5YgAZKNvBoJmmr05Eh9cYQjPEZiRHY95TKU
	 KAl8taOkfCxK7Teumesgv5Hyb75fskpRBlyXEuRWERoXaNWrGS6NXokp8rQrRgnY52
	 GOpXiWy6cXkrQ==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9C6D26024D;
	Mon, 18 May 2026 20:32:53 +0800 (AWST)
Message-ID: <64f6ad212446c55780601a6477478b5ace09d930.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3] ARM: dts: aspeed: anacapa: Add eeprom device node
 for NFC adaptor board
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: carl.lee@amd.com, Colin Huang <u8813345@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, 	linux-kernel@vger.kernel.org,
 peter.shen@amd.com, colin.huang2@amd.com
Date: Mon, 18 May 2026 22:02:53 +0930
In-Reply-To: <20260331-arm-dts-aspeed-anacapa-add-eeprom-device-v3-1-2bb2226fbb4e@amd.com>
References: 
	<20260331-arm-dts-aspeed-anacapa-add-eeprom-device-v3-1-2bb2226fbb4e@amd.com>
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
X-Rspamd-Queue-Id: 321B756CB89
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[codeconstruct.com.au,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[codeconstruct.com.au:s=2022a];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4067-lists,linux-aspeed=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[amd.com,gmail.com];
	FORGED_SENDER(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:carl.lee@amd.com,m:u8813345@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:peter.shen@amd.com,m:colin.huang2@amd.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[codeconstruct.com.au:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hi Carl,

Sorry for the delay.

On Tue, 2026-03-31 at 16:02 +0800, Carl Lee via B4 Relay wrote:
> From: Carl Lee <carl.lee@amd.com>
>=20
> Add eeprom device node for NFC adaptor board FRU.
>=20
> Signed-off-by: Carl Lee <carl.lee@amd.com>

Do you mind coordinating with Colin to integrate this change? He is in
the process of reorganising the Anacapa devicetrees.

Andrew

