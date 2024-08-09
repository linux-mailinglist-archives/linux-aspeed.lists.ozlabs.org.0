Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DD2957971
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:57:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqJQ4LYyz7Bl9
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:56:54 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=iLtW4bYb;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=1ED2P/xX;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=iLtW4bYb;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=1ED2P/xX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=jdelvare@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WgPBQ6WrPz2yL0;
	Fri,  9 Aug 2024 22:59:26 +1000 (AEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C154321E58;
	Fri,  9 Aug 2024 12:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723208357; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vnc+WH7j7DUSFdRWJCuP1bwPsfsVy7xPQd2NtzSaUlI=;
	b=iLtW4bYbTX9VXyhDvo7F1yQph1QOx4c4/+12asbRCuSSPdIT1ehlSy2fXQre8/QOeeB3+J
	TuyRpHAh4Phe88pDsbb10PdRl+OtPJlUudeH3Sd5SKCw8L0SoGBNhPz5F9ZF1szz3k35MM
	c9/pISRVJC9gUNfJkJCxMVR/CELNvik=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723208357;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vnc+WH7j7DUSFdRWJCuP1bwPsfsVy7xPQd2NtzSaUlI=;
	b=1ED2P/xXrJB3fn0rQ70bR2oixNj5CO7G/wl1aojmZZhxEq4J1n2tNcDYQAU0QW49t07B+n
	0tprKaOg4IzeKpCg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=iLtW4bYb;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="1ED2P/xX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723208357; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vnc+WH7j7DUSFdRWJCuP1bwPsfsVy7xPQd2NtzSaUlI=;
	b=iLtW4bYbTX9VXyhDvo7F1yQph1QOx4c4/+12asbRCuSSPdIT1ehlSy2fXQre8/QOeeB3+J
	TuyRpHAh4Phe88pDsbb10PdRl+OtPJlUudeH3Sd5SKCw8L0SoGBNhPz5F9ZF1szz3k35MM
	c9/pISRVJC9gUNfJkJCxMVR/CELNvik=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723208357;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vnc+WH7j7DUSFdRWJCuP1bwPsfsVy7xPQd2NtzSaUlI=;
	b=1ED2P/xXrJB3fn0rQ70bR2oixNj5CO7G/wl1aojmZZhxEq4J1n2tNcDYQAU0QW49t07B+n
	0tprKaOg4IzeKpCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E10311379A;
	Fri,  9 Aug 2024 12:59:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1oAxMKEStmacdwAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Fri, 09 Aug 2024 12:59:13 +0000
Date: Fri, 9 Aug 2024 14:59:11 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH] i2c: don't use ',' after delimiters
Message-ID: <20240809145911.50cc327f@endymion.delvare>
In-Reply-To: <20240730220401.3649-2-wsa+renesas@sang-engineering.com>
References: <20240730220401.3649-2-wsa+renesas@sang-engineering.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -3.01
X-Rspamd-Queue-Id: C154321E58
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	HAS_ORG_HEADER(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,amd.com,linux.dev,kernel.crashing.org,jms.id.au,codeconstruct.com.au,tkos.co.il,nxp.com,pengutronix.de,iki.fi,kemnade.info,baylibre.com,atomide.com,ti.com,mleia.com,samsung.com,lists.ozlabs.org,lists.infradead.org,lists.linux.dev];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[renesas];
	R_RATELIMIT(0.00)[to_ip_from(RLx5ghmqs35ey73zpnq1znwten),from(RLoz63kdxwtinegqpbiqua)];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spam-Flag: NO
X-Mailman-Approved-At: Tue, 20 Aug 2024 09:56:01 +1000
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: imx@lists.linux.dev, Baruch Siach <baruch@tkos.co.il>, Shyam Sundar S K <shyam-sundar.s-k@amd.com>, Vignesh R <vigneshr@ti.com>, linux-aspeed@lists.ozlabs.org, Tony Lindgren <tony@atomide.com>, Brendan Higgins <brendan.higgins@linux.dev>, Elie Morisse <syniurge@gmail.com>, linux-i2c@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>, Fabio Estevam <festevam@gmail.com>, linux-samsung-soc@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>, openbmc@lists.ozlabs.org, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Andreas Kemnade <andreas@kemnade.info>, Andrew Jeffery <andrew@codeconstruct.com.au>, Andi Shyti <andi.shyti@kernel.org>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>, Roger Quadros <rogerq@kernel.org>, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Dong Aisheng <aisheng.dong@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 31 Jul 2024 00:01:59 +0200, Wolfram Sang wrote:
> Delimiters are meant to be last, no need for a ',' there. Remove a
> superfluous newline in the ali1535 driver while here.

Thanks for the cleanup.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
