Return-Path: <linux-aspeed+bounces-3881-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MF+GDRdY12kFMggAu9opvQ
	(envelope-from <linux-aspeed+bounces-3881-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Thu, 09 Apr 2026 09:41:11 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9693C7259
	for <lists+linux-aspeed@lfdr.de>; Thu, 09 Apr 2026 09:41:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4frs7k15XTz2ygY;
	Thu, 09 Apr 2026 17:31:46 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1775719906;
	cv=none; b=mBA8BfJMOc2ImvGvPb8FrOHWXchiTfxlwXPWbiDggPhRXWMyl42aQ0uXjTjmtUZRpkKKXoA/uU4/r0fi9/RUlSeziO8oYoQFgsaUPK8iVcAYOWunKSTzYPGPa6liVz90VUf+axF0JSTGj9R5p6YORz/WY0pKh5BQzv/IR87WPUlLRs/jBP3wLuHQILIgdnyxQeMYPr+EvZIGdQbxX8FVxMClAst68gacHhBseJQyiihgfEPMD9ApLsFDtXSt1m3O4iuwGd7HznA+0dUfXI4bIFVQqOyv+G/12Vkz6Cd3ax+k2/QP4nzV4hojFQPRefUpFAummdJIiwji1RQORS0Ocg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1775719906; c=relaxed/relaxed;
	bh=/NkLF4MygYy5gKmKhlqnhxgftiNvN3ddcJNBsSrhiws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LVvrAnaAKAX7GOP64jaj3CRINsMFef4HayUGDpdn4wYiI7abhjbxvi1ZgK+penCEd3uO10UEIsxaqZRCjG2TSq8D26RH3YK8A7p8zy/E7vUuiwOO0OuF+9biSq1797mUx9QtWsnImmv9VtN/OU4zsPkLueawc3pQQN09H7SEgrWVMzLzQh/JdQWWmNaXoj2v1ch6Z8BcVBoPRvfd0swxf/puLf90ZUpeVyBrHP0Zo3oMPmSIVeHV0avQpknae6r60/PDxpUA9U7Sgx42945Jcd/jJvrRJsOZTTMIb40yg/KKkdhMOH9WTJX9x0M5erT39t3yaEzJLBJoWaBnglHpag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P1V3bA0G; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P1V3bA0G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4frs7j3svNz2xTh
	for <linux-aspeed@lists.ozlabs.org>; Thu, 09 Apr 2026 17:31:45 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A07BB600AD;
	Thu,  9 Apr 2026 07:31:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C547FC4CEF7;
	Thu,  9 Apr 2026 07:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775719903;
	bh=xoXaHyJutfcxSGhgHWM74nFyJDBXvAN8t1HEtk8e6vY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P1V3bA0Gzx8Fwg65L8SnBoKFD6eyiea3S/Y2uxq8LK+hYe0oJUYUkPN+ZpqJGS9Kw
	 txd7qibsvXqwu7xi5KYPir2Agb/zIPjfAR6CRySWRvrffJPp0rQ6jVLTlWL5t9z4aN
	 wY/ohTIkESdhFiKCEp9eBzhEl5HkEWyHKLhQLy8zQNBzJjlsaYoUkIKsYJfYI2z8jd
	 Z68yTV5jmF0LAcPe/fuCY6/c7BMtM782ASnFqB2UEkU6/Wyc8oQgO+NCpthhnxgFgi
	 n969xqxvD0SzDMwlTr3oo4RGRuNy0pVeKeETFZS5xkALG0mIaM3VC8rtdsF6g0GLwC
	 dR9q86Zb7gJUQ==
Date: Thu, 9 Apr 2026 09:31:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dawid Glazik <dawid.glazik@linux.intel.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, linux-aspeed@lists.ozlabs.org, linux-i3c@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Frank Li <Frank.Li@nxp.com>, Maciej Lawniczak <maciej.lawniczak@intel.com>, 
	Jeremy Kerr <jk@codeconstruct.com.au>
Subject: Re: [PATCH v3 2/3] ARM: dts: aspeed-g6: Add nodes for i3c controllers
Message-ID: <20260409-beautiful-paper-labradoodle-d846f1@quoll>
References: <cover.1775679285.git.dawid.glazik@linux.intel.com>
 <51c4bdc02b45f67a0e32610a228091e137c135a6.1775679285.git.dawid.glazik@linux.intel.com>
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
In-Reply-To: <51c4bdc02b45f67a0e32610a228091e137c135a6.1775679285.git.dawid.glazik@linux.intel.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [5.29 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	R_DKIM_ALLOW(0.00)[kernel.org:s=k20201202];
	TAGGED_FROM(0.00)[bounces-3881-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-aspeed@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:dawid.glazik@linux.intel.com,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:linux-aspeed@lists.ozlabs.org,m:linux-i3c@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:Frank.Li@nxp.com,m:maciej.lawniczak@intel.com,m:jk@codeconstruct.com.au,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	R_SPF_ALLOW(0.00)[+ip6:2404:9400:21b9:f100::1];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.994];
	MISSING_XM_UA(0.00)[];
	ARC_ALLOW(0.00)[lists.ozlabs.org:s=201707:i=1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,1e7a0000:email]
X-Rspamd-Queue-Id: 7E9693C7259
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 08, 2026 at 10:34:34PM +0200, Dawid Glazik wrote:
> +			bus@1e7a0000 {
> +				compatible = "simple-bus";
> +				#address-cells = <1>;
> +				#size-cells = <1>;
> +				ranges = <0 0x1e7a0000 0x8000>;
> +
> +				i3c_global: i3c-global@0 {
> +					compatible = "aspeed,ast2600-i3c-global", "syscon";

Also undocumented ABI. Apply this patch and run checkpatch.


Best regards,
Krzysztof


