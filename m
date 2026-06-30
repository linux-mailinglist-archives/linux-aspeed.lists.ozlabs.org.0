Return-Path: <linux-aspeed+bounces-4324-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gop/BDgCRGrjnAoAu9opvQ
	(envelope-from <linux-aspeed+bounces-4324-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Jun 2026 19:51:52 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE0D6E7080
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Jun 2026 19:51:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=HJCQ722M;
	spf=pass (mail.lfdr.de: domain of "linux-aspeed+bounces-4324-lists+linux-aspeed=lfdr.de@lists.ozlabs.org" designates 112.213.38.117 as permitted sender) smtp.mailfrom="linux-aspeed+bounces-4324-lists+linux-aspeed=lfdr.de@lists.ozlabs.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("lists.ozlabs.org:s=201707:i=1")
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gqW1H6Jxsz2yR5;
	Wed, 01 Jul 2026 03:51:47 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1782841907;
	cv=none; b=XYhk8/B2ovWMP90XukSnNOWh2cL/PVw5ei/geyau/pmeTxUwglGk/EZR3xEWtX0mk00rdfxtNolI141nGykid3rrc2qPdqS/UduAtdKPc1knAJIKk7+fuAS0/IPKSl5F9ijmUS6Iknts0g5X+gPaCBNJ6Qn+acnIj47FE72UsHVL+lhwFApIIi9in9LXfQLSzWF3Uy/gU99ln3SV7BJ/CpSGpIeYVb+cL5ykcpw8FL+4ajHFj7KFjDBYXlTc4y9VRP9TFzQOoqpP8Ajb+Plb1IN07KfPqhn9RRHLquef69hQDfmr8ZOd3cgQnAK5uBueLJ2hNBp2bUEQzBBaBi5oIA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1782841907; c=relaxed/relaxed;
	bh=rpVzYJiD4uvUrnHrs1i+rq74dWRX/dxoOQRnlJsTbJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=foz6NsN4dLD4RErE6zYF0M8+xp4iUhiJO0sskyt5xWFtnUpC38/RFkQGB/GYKFXliZeRT6v+g/vJIx64SytTaEw1SAjfLFy/92gUeEvaP5GsfJtjB8bUl3dKa+jLoOK2k/bg5m7t6MVix8AVydyaTxgQ47AkUTppTg/BrBso78rdUbtTKr0GkexBtcJiA/AWSX5LEzE16ryUNGurtsFyTmbPpLmohjdb1zsp47MZzI1FLuIUHhkxb0gm5jD4KF0mLOiD5UcQpCEKFeW10QsJgenGJ4StBxfLMtUPu57wZ3D3RyYDqUiT8zE4RuRUXYimeeErWKdWi6Yn9f+WImaStg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HJCQ722M; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gqW1H0zGhz2xq0
	for <linux-aspeed@lists.ozlabs.org>; Wed, 01 Jul 2026 03:51:47 +1000 (AEST)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 593B5600BB;
	Tue, 30 Jun 2026 17:51:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAFF11F000E9;
	Tue, 30 Jun 2026 17:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782841904;
	bh=rpVzYJiD4uvUrnHrs1i+rq74dWRX/dxoOQRnlJsTbJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HJCQ722MxU+MHC23BSrdoiEHDRw9Ql9TrNC02wM9iluQIfFS2pL7HTm4DMoIfgXor
	 sZPsO5fe+UCnhgLboo8vr0TxYlvWoSm+8RdtT2FaMnWx7JPw0TX2lNogNtAM5ZteTw
	 1kPr6vuoJgOVYliMJqn+WxyV5po2NSC7PUY1wPojHU/iIW2U9UbFEofK+nGj/7RIjd
	 3DSwICjJtI0nh+5j6ehuYBM+m0cJZgkyxCrI7fDAXrV/x7GCwCEd9pXhsyxB0HIQJu
	 iSdfJvxZ1SPFEXVsbW8oYXCvLLbzRKpZuZq4gN4PrBGSb4ybV8zVkVSfUroRrLgIN0
	 CwPpm9MKm8V3Q==
Date: Tue, 30 Jun 2026 12:51:43 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: yc_hsieh@aspeedtech.com, Corey Minyard <corey@minyard.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	openipmi-developer@lists.sourceforge.net,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH 3/4] dt-bindings: ipmi: Add optional LPC properties to
 ASPEED BT devices
Message-ID: <20260630175143.GA4129206-robh@kernel.org>
References: <20260629-aspeed-bt-bmc-multichannel-v1-0-fc23ee337f7a@aspeedtech.com>
 <20260629-aspeed-bt-bmc-multichannel-v1-3-fc23ee337f7a@aspeedtech.com>
 <35a8e3b3-7725-4d1b-8667-84e6fa24b2ca@kernel.org>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35a8e3b3-7725-4d1b-8667-84e6fa24b2ca@kernel.org>
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4324-lists,linux-aspeed=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:yc_hsieh@aspeedtech.com,m:corey@minyard.net,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:openipmi-developer@lists.sourceforge.net,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-aspeed@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,lists.ozlabs.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1AE0D6E7080

On Tue, Jun 30, 2026 at 08:11:34AM +0200, Krzysztof Kozlowski wrote:
> On 29/06/2026 08:49, Yu-Che Hsieh via B4 Relay wrote:
> > From: Yu-Che Hsieh <yc_hsieh@aspeedtech.com>
> > 
> > Allocating IO and IRQ resources to LPC devices is in-theory an operation
> > 
> > for the host, however ASPEED systems describe these resources through
> > 
> > BMC-internal configuration, as already supported by the ASPEED KCS BMC
> 
> What
> 
> is
> 
> with
> 
> this
> 
> line breaks?

I've seen Codex do this... It amazes me how hard it is to get it to 
write properly formatted commit messages and then not forget how to 
write them.

Rob

