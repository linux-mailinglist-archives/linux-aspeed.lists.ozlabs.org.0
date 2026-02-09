Return-Path: <linux-aspeed+bounces-3507-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOfkLESEiWl8+QQAu9opvQ
	(envelope-from <linux-aspeed+bounces-3507-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Mon, 09 Feb 2026 07:52:52 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EF910C3E3
	for <lists+linux-aspeed@lfdr.de>; Mon, 09 Feb 2026 07:52:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f8b41194gz2yFm;
	Mon, 09 Feb 2026 17:52:49 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770619969;
	cv=none; b=Ued5bzXHD6oVEv7UAUFcbYqEJhAB1Nsd0nFhxD+cF1yseHHc0dLTKVq17ohKl+3fRjCIDZzOZTY5Iy9coeKAcc+P04SSL+26dpD7BoM4iU8ovUX2h+D5YRnB04eYBbGhqvo3xb0rnF9n62hdcGRKgELhr3P02s4f1I6m9/039mwTCZWRGdx8Chyd7pYW+whRQ6rgPKfGGlwBPEuUTwTj59gwBeiaDQiujMe6HuzbI9Z5wz/d8lLOqruOWZDTSlNF5nOXOjH7XC7eEUw2i3y7s7cGEEWzkMoJhFfvAian74EDF2GpkZDebJ9IGQtv3LtzU9w44uBbHY/MDkZYam8Ceg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770619969; c=relaxed/relaxed;
	bh=DXnA0j3/Uan5NIBQI4I1W6jnHOtSk+oiYxhKLyk1rQs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RHDgQZCPVbrN8xwCVpyBLpM33Kpfiyl1FNwy8+zG1bVj7AX5N4ZPLfq5H7mx0ZQz+ui18VA2ldqqPkQVC7Vfc+wVFaRgQwmg+U/3f+uq5hrHf/FDM6I5hTnwUnSOKCFVDjC7lrXar3S89HFwpogItcej5FloToasd+HUCfJEHZazfRrWcofPadtYVS6NyZkj9Gk7HiX/2UpgiuEZ3wRMDBlHhTD6ischCqB8cRouCw/i1MgelcuxcArqALfPOD09S7gnMysykbT5+4FnHY9Co1YYlXbTJcOBwQTSik5JXbNZOt3kaA8yoCVICjNdG4+dPCYAlHpifyU4nshBKkBaVw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ZczRkzXw; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ZczRkzXw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f8b404DnTz2xHX
	for <linux-aspeed@lists.ozlabs.org>; Mon, 09 Feb 2026 17:52:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1770619967;
	bh=DXnA0j3/Uan5NIBQI4I1W6jnHOtSk+oiYxhKLyk1rQs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ZczRkzXwsZb8Vw/Es5bl+YtLjtKWM8ggFl4VnyzivSXkJxsukfBKPb8BKjxgEaSw6
	 W36H3pIY8DaDHOJcdoyF6GV6x/BgedWJJpWgZvXxpXL8WtJDlOSxCCYfd2FvwAWJgb
	 FqU75z1xX1v/DSFsD2qONMNHJH/T63ZXMuOxNJUBhoNlLrO07QT77yZec17HF4tBa7
	 ZTymBHYvEGEJiP3uGTYtbRGzlo9TQUnKhunR6bBH9a1AM2bBigMlp9on8u/kfJOgm9
	 aWuB41PCIGSne8cqrcD0xTGrsZsys4L8ZHW5l7HvvYTFIrgW2F9WZaFklDEAfYXZO+
	 ZV95GtEoFbRgw==
Received: from [192.168.68.117] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 5679B602DE;
	Mon,  9 Feb 2026 14:52:47 +0800 (AWST)
Message-ID: <e7671063304f1bfdb66bc4e7d271c9e836bbe3cc.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: add Meta SanMiguel BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Potin Lai <potin.lai.pt@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>, Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Cosmo Chou
	 <cosmo.chou@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, Potin Lai
	 <potin.lai@quantatw.com>, Roger Kan <Roger.Kan@quantatw.com>
Date: Mon, 09 Feb 2026 17:22:47 +1030
In-Reply-To: <20260203-sanmiguel_init_dts-v2-2-6a5682c32b38@gmail.com>
References: <20260203-sanmiguel_init_dts-v2-0-6a5682c32b38@gmail.com>
	 <20260203-sanmiguel_init_dts-v2-2-6a5682c32b38@gmail.com>
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
	RCVD_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-3507-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,jms.id.au,stwcx.xyz];
	FORGED_SENDER(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:potin.lai.pt@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:patrick@stwcx.xyz,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:cosmo.chou@quantatw.com,m:Mike_Hsieh@quantatw.com,m:potin.lai@quantatw.com,m:Roger.Kan@quantatw.com,m:potinlaipt@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.980];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[codeconstruct.com.au:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[codeconstruct.com.au:mid,codeconstruct.com.au:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: C1EF910C3E3
X-Rspamd-Action: no action

On Tue, 2026-02-03 at 17:48 +0800, Potin Lai wrote:
> Add linux device tree entry for Meta (Facebook) SanMiguel compute-
> tray
> BMC using AT2620 SoC.
>=20
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>

Ah, I missed that there was a v2, however my comments on the v1 DTS
still appear to apply. Can you address them?

Andrew

